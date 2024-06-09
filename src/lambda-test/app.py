import os

def lambda_handler(event, context) -> str:
    """Lambdaとして実行される関数のエントリーポイント

    Args:
        event (_type_): Lambdaのイベント. 変数
        context (_type_): _description_

    Returns:
        _type_: _description_
    """

    env_value: str = os.getenv("TEST", "")

    return env_value
