resource "aws_iam_policy" "policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My test policy"

  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.bucket.arn}"
    }
  ]

}
EOT
}
data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect = "Allow"
  }
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.bucket.arn]
    effect = "Allow"
  }
}
 resource "aws_iam_policy" "policy" {
   name        = "${random_pet.pet_name.id}-policy"
   description = "My test policy"
  policy = data.aws_iam_policy_document.example.json
  policy = <<EOT
 {
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": [
         "s3:ListAllMyBuckets"
       ],
       "Effect": "Allow",
       "Resource": "*"
     },
     {
       "Action": [
         "s3:*"
       ],
       "Effect": "Allow",
       "Resource": "${aws_s3_bucket.bucket.arn}"
     }
   ]
 }
 EOT
 }

