export interface BoardDto {
    key: string;
    
    ordinal: number;
    title: string;
    note: string;

    createdIp: string;
    createdUtc: Date;
    createdBy: string;
    
    update:  boolean;
    updatedIp: string;
    updatedUtc: Date;
    updatedBy: string;
    
    deleted: boolean;
    deletedIp: string;
    deletedUtc: Date;
    deletectBy: string;
}
