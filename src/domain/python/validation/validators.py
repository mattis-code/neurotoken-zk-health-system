"""
Validation Layer — Python Edition
"""

def validate_progress_event(evt):
    if not evt.user_id:
        raise ValueError("user_id missing")
    if not isinstance(evt.delta, (float, int)):
        raise ValueError("delta must be numeric")
    return True

def validate_health_score(score):
    if not isinstance(score.value, (float, int)):
        raise ValueError("score.value must be numeric")
    return True
