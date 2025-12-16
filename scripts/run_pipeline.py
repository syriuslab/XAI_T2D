import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--stage", default="all")
    args = parser.parse_args()
    print("Pipeline stub, stage:", args.stage)

if __name__ == "__main__":
    main()
