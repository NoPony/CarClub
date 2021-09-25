using System;

namespace NoPony.CarClub.Api.Utility.Cache
{
    public class Cache<T>
    {
        private readonly TimeSpan _duration;
        private readonly Func<T> _refresh;

        private DateTime? _expiry;

        private T _value;

        public T Value
        {
            get
            {
                if (_expiry == null || _expiry > DateTime.Now)
                {
                    _value = _refresh();

                    _expiry = DateTime.UtcNow.Add(_duration);
                }

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
            _expiry = null;
        }
    }
}
