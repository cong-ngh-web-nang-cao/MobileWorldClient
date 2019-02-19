package Models;

public class SanPhamViewModel {
	private int Id;
	private String DanhMuc;
	private String NhaSanXuat;
	private String TenSP;
	private int Gia;
	private int CamTruoc;
	private int CamSau;
	private int ROM;
	private int RAM;
	private int TheNho;
	
	public void setId(int _Id) {
		this.Id = _Id;
	}
	public int getId() {
		return Id;
	}
	
	public void setDanhMuc(String _DanhMuc) {
		this.DanhMuc = _DanhMuc;
	}
	public String getDanhMuc() {
		return DanhMuc;
	}
	
	public void setNhaSanXuat(String _NhaSanXuat) {
		this.NhaSanXuat = _NhaSanXuat;
	}
	public String getNhaSanXuat() {
		return NhaSanXuat;
	}
	
	public void setTenSP(String _TenSP) {
		this.TenSP = _TenSP;
	}
	public String getTenSP() {
		return TenSP;
	}
	
	public void setGia(int _Gia) {
		this.Gia = _Gia;
	}
	public int getGia() {
		return Gia;
	}
	
	public void setCamTruoc(int _CamTruoc) {
		this.CamTruoc = _CamTruoc;
	}
	public int getCamTruoc() {
		return CamTruoc;
	}
	
	public void setCamSau(int _CamSau) {
		this.CamSau = _CamSau;
	}
	public int getCamSau() {
		return CamSau;
	}
	
	public void setROM(int _ROM) {
		this.ROM = _ROM;
	}
	public int getROM() {
		return ROM;
	}
	
	public void setRAM(int _RAM) {
		this.RAM = _RAM;
	}
	public int getRAM() {
		return RAM;
	}
	
	public void setTheNho(int _TheNho) {
		this.TheNho = _TheNho;
	}
	public int getTheNho() {
		return TheNho;
	}
}
