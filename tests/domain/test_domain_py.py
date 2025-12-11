from src.domain.python.entities import ProgressEvent, HealthScore
from src.domain.python.validation.validators import validate_progress_event

def test_progress_event_validation():
    evt = ProgressEvent("u123", 5, 123456)
    assert validate_progress_event(evt) is True
