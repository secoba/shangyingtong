<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%@ include file="/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/common/meta.jsp" %>
		<%@ include file="/common/sys.jsp" %>
		<title>${ACT.name}</title>
		
		<f:css href="/css/page.css"/>
		<f:js src="/js/jquery.js"/>
		<f:js src="/js/plugin/jquery.metadata.js"/>
		<f:js src="/js/plugin/jquery.validate.js"/>
		<f:js src="/js/sys.js"/>
		<f:js src="/js/common.js"/>
		<f:js src="/js/paginater.js"/>
		

		<style type="text/css">
			html { overflow-y: scroll; }
		</style>
	</head>
    
	<body>
		<jsp:include flush="true" page="/layout/location.jsp"></jsp:include>
		
		<!-- 查询功能区 -->
		<div class="userbox">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentb">
				<s:form id="searchForm" action="list.do" cssClass="validate-tip">
					<table class="form_grid" width="100%" border="0" cellspacing="3" cellpadding="0">
						<caption>${ACT.name}</caption>
						<tr>
<!-- 							<td align="right">抽奖活动ID</td> -->
<!-- 							<td><s:textfield name="drawDef.drawId" cssClass="{digitOrLetter:true}"/></td> -->
							
							<td align="right">抽奖活动名称</td>
							<td><s:textfield name="drawDef.drawName"/></td>
							
							<td align="right">参与机构</td>
							<td><s:textfield name="drawDef.pinstId"/></td>
							
							<td align="right">抽奖方法</td>
							<td>
								<s:select name="drawDef.drawType" list="drawTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name"></s:select>
							</td>
						</tr>
	
						<tr>
							<td align="right">交易类型</td>
							<td>
								<s:select name="drawDef.transType" list="transTypeList" headerKey="" headerValue="--请选择--" listKey="value" listValue="name"></s:select>
							</td>
							<td height="30" colspan="4">
								<input type="submit" value="查询" id="input_btn2"  name="ok" />
								<input style="margin-left:30px;" type="button" value="清除" onclick="FormUtils.reset('searchForm')" name="escape" />
							</td>
						</tr>
					</table>
					<s:token name="_TOKEN_LOTTER_DRAW_DEF_LIST"/>
				</s:form>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		
		<!-- 数据列表区 -->
		<div class="tablebox">
			<table class="data_grid" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			   <td align="center" nowrap class="titlebg">抽奖活动ID</td>
			   <td align="center" nowrap class="titlebg">抽奖活动名称</td>
			   <td align="center" nowrap class="titlebg">参与机构类型</td>
			   <td align="center" nowrap class="titlebg">参与机构</td>
			   <td align="center" nowrap class="titlebg">抽奖方法</td>
			   <td align="center" nowrap class="titlebg">交易类型</td>
			   <td align="center" nowrap class="titlebg">生效日期</td>
			   <td align="center" nowrap class="titlebg">失效日期</td>
			   <td align="center" nowrap class="titlebg">状态</td>
			   <td align="center" nowrap class="titlebg">操作</td>
			</tr>
			</thead>
			<s:iterator value="page.data"> 
			<tr>
			  <td nowrap>${drawId}</td>
			  <td align="center" nowrap>${drawName}</td>
			  <td align="center" nowrap>${pinstTypeName}</td>
			  <td align="center" nowrap>${pinstId}-${fn:branch(pinstId)}${fn:merch(pinstId)}</td>
			  <td align="center" nowrap>${drawTypeName}</td>
			  <td align="center" nowrap>${transTypeName}</td>
			  <td align="center" nowrap>${effDate}</td>
			  <td align="center" nowrap>${expirDate}</td>
			  <td align="center" nowrap>${statusName}</td>
			  <td align="center" nowrap>
			  	<span class="redlink">
			  		<s:if test="status == 10">
			  		    <a href="javascript:submitUrl('searchForm', '/lottery/drawAward/startDrawAward.do?drawId=${drawId}', '确定要开始抽奖吗？');" />开始抽奖</a>
			  		</s:if>
			  		<s:if test="status == 21">
			  		    <f:link href="/lottery/drawAward/showDrawAward.do?awardReg.drawId=${drawId}">查看中奖信息</f:link>
			  		</s:if>
			  	</span>
			  </td>
			</tr>
			</s:iterator>
			</table>
			<f:paginate name="page"/>
		</div>

		<jsp:include flush="true" page="/layout/copyright.jsp"></jsp:include>
	</body>
</html>