import os

def lambda_handler(event, context) -> str:
    """Lambdaとして実行される関数のエントリーポイント

    Args:
        event (_type_): Lambdaのイベント. 変数
        context (_type_): _description_

    Returns:
        str: 設定した環境変数を返す
    """

    env_value: str = os.getenv("TEST", "")

    return env_value
