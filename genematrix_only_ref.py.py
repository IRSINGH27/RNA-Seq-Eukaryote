import pandas as pd

def main(x:str):
    df=pd.read_csv(x,sep=',')
    print(df)
    df=df[~df.gene_id.str.contains(r'^MSTRG\.\d+$')]
    print(df)
    df.set_index('gene_id').to_csv('only_ref_gene_count_matrix.csv')


if __name__=='__main__':
    from argparse import ArgumentParser
    parser=ArgumentParser()
    parser.add_argument('--input','-i',help='input file',type=str)
    args=parser.parse_args()
    main(x=args.input)
