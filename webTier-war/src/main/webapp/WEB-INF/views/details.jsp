<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Details</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<sec:authorize access="hasAnyRole('ADMIN')">
    <div ng-controller="ItemController as ctrl">
        <jsp:include page="/WEB-INF/views/modal.jsp" flush="true"></jsp:include>
    </div>
</sec:authorize>
<div class="single-product-area" ng-app="myApp" ng-controller="DetailsController as ctrl" ng-cloak>
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="">All products</a>
                        <a href="">{{ctrl.items.objectType.name}}</a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img ng-src="${contextPath}{{ctrl.items.mapParameters.icon.value}}" alt="">
                                </div>
                                <div class="product-gallery">

                                    <img ng-show="ctrl.items.mapParameters.icon2.value != null"
                                         ng-src="${contextPath}{{ctrl.items.mapParameters.icon2.value}}" alt="">

                                    <img ng-show="ctrl.items.mapParameters.icon3.value != null"
                                         ng-src="${contextPath}{{ctrl.items.mapParameters.icon3.value}}" alt="">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name">{{ctrl.items.mapParameters.name.value}}</h2>
                                <div class="product-inner-price">
                                    <ins>₴ {{ctrl.items.mapParameters.price.value}}</ins>
                                </div>
                                <form ng-submit="ctrl.buy(ctrl.items.id, quant)" class="cart">
                                    <div class="quantity">
                                        <input type="number" ng-hide="ctrl.items.mapParameters.quantity.value == '0'"
                                               ng-model="quant" ng-init="quant=1" ng-click="" size="4"
                                               class="input-text qty text" title="Qty"
                                               value="1"
                                               name="quantity" min="1" step="1"
                                               max="{{ctrl.items.mapParameters.quantity.value}}">
                                    </div>
                                    <button class="add_to_cart_button"
                                            ng-disabled="ctrl.items.mapParameters.quantity.value == '0'">
                                        {{ctrl.items.mapParameters.quantity.value == '0' ? 'SOLD OUT' : 'Add to cart'}}
                                    </button>
                                </form>

                                <div role="tabpanel">
                                    <div class="tab-content">
                                        <p role="tabpanel" class="tab-pane fade in active" id="home">
                                        <h2>Product Description</h2>
                                        <div ng-repeat="p in ctrl.items.mapParameters">
                                            <div ng-if="(p.attribute.name != 'icon' && p.attribute.name != 'icon2' && p.attribute.name != 'icon3' && p.attribute.name != 'price' && p.attribute.name != 'name')">
                                                <b> {{p.attribute.name}} : </b> {{p.value}} <br/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="related-products-wrapper">
                    <h2 class="related-products-title">Related Products</h2>
                    <div class="related-products-carousel">

                        <data-owl-carousel class="owl-carousel"
                                           data-options="{navigation: true, pagination: true, rewindNav : true}">
                            <div owl-carousel-item="" ng-repeat="z in ctrl.related">
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img ng-src="${contextPath}{{z.mapParameters.icon.value}}" alt="">
                                        <div class="product-hover">
                                            <a href="#" class="add-to-cart-link"
                                               ng-click="(z.mapParameters.quantity.value == '0')||ctrl.buyR(z.id)"><i
                                                    class="fa fa-shopping-cart"></i> {{z.mapParameters.quantity.value ==
                                                '0' ? 'SOLD OUT' : 'Add to cart'}}</a>
                                            <a href="${contextPath}/details/{{z.id}}" class="view-details-link"
                                               target="_self"><i
                                                    class="fa fa-link"></i> See details</a>
                                        </div>
                                    </div>

                                    <h2 ng-bind="z.mapParameters.name.value"></h2>

                                    <div class="product-carousel-price">
                                        <ins>Price: {{z.mapParameters.price.value}}</ins>
                                    </div>
                                </div>
                            </div>
                        </data-owl-carousel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>