import sys
import numpy as np

def hertz_to_mel(freq: float) -> float:
    """
    Convert frequency from hertz to mels.

    Args:
        freq:
            The frequency, or multiple frequencies, in hertz (Hz).

    Returns:
        `float` : The frequencies on the mel scale.
    """

    min_log_hertz = 1000.0
    min_log_mel = 15.0
    logstep = 27.0 / np.log(6.4)
    mels = 3.0 * freq / 200.0

    if isinstance(freq, np.ndarray):
        log_region = freq >= min_log_hertz
        mels[log_region] = min_log_mel + np.log(freq[log_region] / min_log_hertz) * logstep
    elif freq >= min_log_hertz:
        mels = min_log_mel + np.log(freq / min_log_hertz) * logstep

    return mels

if __name__=="__main__":
    # if len(sys.argv) > 1:
    #     data = sys.argv[1]
    #     print("Received data:", data)
    # else:
    #     print("No data provided.")
    mels = hertz_to_mel(200.0) 
    print(mels)
