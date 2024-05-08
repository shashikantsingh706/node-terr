data "aws_sns_topic" "ecs_failed_task_topic" {
    name = "ecs_failed_task_topic"
}
  


# Create CloudWatch Events Rule for ECS task failure or stop
resource "aws_cloudwatch_event_rule" "ecs_task_failure_rule" {
  name                = "ecs_task_failure_rule"
  description         = "Trigger on ECS task failures or stops"
  event_pattern       = <<PATTERN
{
  "source": ["aws.ecs"],
  "detail-type": ["ECS Task State Change"],
  "detail": {
    "lastStatus": ["STOPPED"]
  }
}
PATTERN
}

# Associate CloudWatch Events Rule with existing SNS Topic
resource "aws_cloudwatch_event_target" "ecs_task_failure_target" {
  rule      = aws_cloudwatch_event_rule.ecs_task_failure_rule.name
  target_id = "send_notification"
  arn = data.aws_sns_topic.ecs_failed_task_topic.arn
}
