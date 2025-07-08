<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<aside class="main-sidebar">
  <section class="sidebar">
    <!-- search form -->
    <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
      </div>
    </form>
    <!-- /.search form -->
     <ul class="sidebar-menu" data-widget="tree">
       <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <c:if test="${user == null}">
        <li class="active"><a href="/board/login"><i class="fa fa-link"></i> <span>DB로그인</span></a></li>
        </c:if>
        <c:if test="${user != null}">
        <li class="active"><a href="/board/logout"><i class="fa fa-link"></i> <span>DB로그아웃</span></a></li>
        </c:if>
        <li><a href="/board/list"><i class="fa fa-link"></i> <span>기본 게시판1</span></a></li>
        <li><a href="/board/list?bname=free2"><i class="fa fa-link"></i> <span>기본 게시판2</span></a></li>
        <li><a href="/board/custom"><i class="fa fa-link"></i> <span>커스텀 게시판</span></a></li>
        
        <!-- 실시간 글로벌 금융/경제/주식 AI 분석 플랫폼 -->
        <li class="header">🌍 GLOBAL FINANCE AI</li>
       <li class="treeview">
          <a href="#"><i class="fa fa-chart-line"></i> <span>실시간 금융 분석</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
         </a>
         <ul class="treeview-menu">
            <li><a href="/finance/dashboard"><i class="fa fa-dashboard"></i> 대시보드</a></li>
            <li><a href="/finance/stocks"><i class="fa fa-globe"></i> 글로벌 주식</a></li>
            <li><a href="/finance/market-trends"><i class="fa fa-trending-up"></i> 시장 트렌드</a></li>
            <li><a href="/finance/ai-analysis"><i class="fa fa-robot"></i> AI 분석</a></li>
         </ul>
       </li>
        
        <!-- 🚀 완벽한 암호화폐 분석 플랫폼 -->
        <li class="header">🚀 CRYPTO UNIVERSE</li>
        <li class="treeview">
          <a href="#"><i class="fa fa-bitcoin"></i> <span>암호화폐 분석</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/crypto/dashboard"><i class="fa fa-dashboard"></i> 🎯 실시간 대시보드</a></li>
            <li><a href="/crypto/market"><i class="fa fa-globe"></i> 📊 전체 시장</a></li>
            <li><a href="/crypto/analysis"><i class="fa fa-chart-bar"></i> 🔬 고급 분석</a></li>
            <li><a href="/crypto/portfolio"><i class="fa fa-briefcase"></i> 💼 포트폴리오</a></li>
            <li><a href="/crypto/defi"><i class="fa fa-university"></i> 🏦 DeFi 프로토콜</a></li>
            <li><a href="/crypto/nft"><i class="fa fa-palette"></i> 🎨 NFT 마켓</a></li>
     </ul>
        </li>
        
        <!-- 포르쉐 섹션 -->
        <li class="header">🏎️ PORSCHE EXPERIENCE</li>
        <li class="treeview">
          <a href="#"><i class="fa fa-car"></i> <span>포르쉐 월드</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/porsche"><i class="fa fa-car"></i> 포르쉐 모델</a></li>
            <li><a href="/porsche/future"><i class="fa fa-rocket"></i> Future Porsche</a></li>
            <li><a href="/porsche/qna/list"><i class="fa fa-question-circle"></i> Q&A 목록</a></li>
            <li><a href="/porsche/qna/write"><i class="fa fa-edit"></i> Q&A 글쓰기</a></li>
          </ul>
        </li>
        
        <li class="header">블로그 분석</li>
        <li><a href="/blogdex_tabs"><i class="fa fa-layer-group"></i> <span>블로그 탭 분석</span></a></li>
        
        <li class="header">CREATIVE LAB</li>
        <li><a href="/lab/creative"><i class="fa fa-palette"></i> <span>AI Art & Music</span></a></li>
        <li><a href="/cosmic"><i class="fa fa-rocket"></i> <span>Cosmic Data Explorer</span></a></li>
        <li><a href="/metaverse"><i class="fa fa-robot"></i> <span>AI 아바타 메타버스</span></a></li>
        <li><a href="/garden"><i class="fa fa-rabbit"></i> <span>가든</span></a></li>
       
      </ul>
  </section>
</aside>