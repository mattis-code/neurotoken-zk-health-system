/**
 * Aggregation Layer — JS Edition
 */

export function aggregateProgress(events) {
  return events.reduce((a, e) => a + e.delta, 0);
}

export function aggregateHealthScores(scores) {
  return scores.reduce((a, s) => a + s.value, 0) / scores.length;
}

export function trackMilestones(milestones) {
  return milestones.filter(m => m.completed).length;
}
