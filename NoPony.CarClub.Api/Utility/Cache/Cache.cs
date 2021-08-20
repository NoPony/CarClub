using System;

namespace NoPony.CarClub.Api.Utility.Cache
{
    public class Cache<T>
    {
        private TimeSpan _duration;
        private Func<T> _refresh;

        private DateTime? _expiry;

        private T _value;

        public T Value
        {
            get
            {
                if (_expiry == null || _expiry > DateTime.Now)
                    _value = _refresh();

                return _value;
            }

            private set
            {
                throw new InvalidOperationException();
            }
        }

        public Cache(TimeSpan Duration, Func<T> Refresh)
        {
            _duration = Duration;
            _refresh = Refresh;
        }
    }
}
