(function() {
    var Curve = function(posPoints, ctrlPoints) {
        this.posPoints = undefined;
        this.ctrlPoints = undefined;

        this.segCount = 0;

        this.set(posPoints, ctrlPoints);
    }

    Curve.prototype.set = function (posPoints, ctrlPoints) {
        this.posPoints = posPoints;
        this.ctrlPoints = ctrlPoints;

        if(posPoints.length !== ctrlPoints.length) {
            console.warn("Curve: posPoints and ctrlPoints's length not equal!");
        }

        this.segCount = posPoints.length - 1;
    }

    Curve.prototype.calc = function () {
        var A0 = new zen3d.Vector2();
        var B0 = new zen3d.Vector2();
        var A1 = new zen3d.Vector2();
        var B1 = new zen3d.Vector2();

        return function calc(t) {
            for(var i = 0; i < this.segCount; i++) {
                if(t >= this.posPoints[i].x && t <= this.posPoints[i + 1].x) {
                    A0.copy(this.posPoints[i]);
                    A1.copy(this.posPoints[i + 1]);
                    B0.copy(this.ctrlPoints[i]);
                    B1.copy(this.ctrlPoints[i + 1]);
                    break;
                }
            }

            if (!A0) {
                A0.copy(this.posPoints[this.posPoints.length - 1]);
            }
            if (!B0) {
                B0.copy(this.ctrlPoints[this.ctrlPoints.length - 1]);
            }
            A1.copy(A1 || A0);
            B1.copy(B1 || B0);

            t = (t - A0.x) / (A1.x - A0.x);
            return this._cubic_bezier(A0.y, B0.y, B1.y, A1.y, t);
        }
    }();

    // TODO: a smarter curve sampler?????

    // average x sampler
    // first x and last x must in result
    // samplerNum can't less than 2
    // result: [t0, value0, t1, value1, ...]
    Curve.prototype.averageXSampler = function(samplerNum) {
        if(samplerNum < 2) {
            console.warn("Curve: sampler num less than 2!");
        }

        var sampler = [];

        var firstT = this.posPoints[0].x;
        var lastT = this.posPoints[this.posPoints.length - 1].x;
        var tempT = (lastT - firstT) / (samplerNum - 1);
        var t = 0;
        for(var i = 0; i < samplerNum; i++) {
            if(i === samplerNum - 1) {
                t = lastT;// fix
            } else {
                t = firstT + i * tempT;
            }

            sampler.push(t, this.calc(t));
        }

        return sampler;
    }

    Curve.prototype._cubic_bezier = function(p0, p1, p2, p3, t) {
        p0 = this._mix(p0, p1, t);
        p1 = this._mix(p1, p2, t);
        p2 = this._mix(p2, p3, t);

        p0 = this._mix(p0, p1, t);
        p1 = this._mix(p1, p2, t);

        p0 = this._mix(p0, p1, t);

        return p0;
    }

    Curve.prototype._mix = function(value0, value1, t) {
        return value0 * (1 - t) + value1 * t;
    }

    zen3d.Curve = Curve;
})();