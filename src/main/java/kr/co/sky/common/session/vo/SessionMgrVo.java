package kr.co.sky.common.session.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SessionMgrVo implements Serializable {

	private static final long serialVersionUID = -4308961795634075112L;

	private String[] PageName;

}
