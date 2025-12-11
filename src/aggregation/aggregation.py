"""
Aggregation Layer — Python Edition
"""

def aggregate_progress(events):
    return sum(e.delta for e in events)

def aggregate_health_scores(scores):
    return sum(s.value for s in scores) / len(scores)

def track_milestones(milestones):
    return len([m for m in milestones if m.completed])
