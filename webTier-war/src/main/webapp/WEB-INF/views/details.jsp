<%@ page import="com.shop.database.entities.Object" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<div class="single-product-area" ng-app="myApp" ng-controller="DetailsController as ctrl">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">


            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="">All products</a>
                        <a href="" ng-bind="{{ctrl.items.objectType}}">{{ctrl.items.objectType}}</a>
                        <a href="" ng-bind="{{ctrl.items.objectType[name]}}"></a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">

                                <div class="product-main-img">
                                    <img src="${contextPath}{{ctrl.items.mapParameters.icon.value}}" alt="">
                                </div>

                                <div class="product-gallery">

                                    <img src="${contextPath}{{ctrl.items.mapParameters.icon2.value}}" alt="">
                                    <img src="${contextPath}{{ctrl.items.mapParameters.icon3.value}}" alt="">

                                </div>

                                <%--<div class="product-gallery">
                                    <c:forEach var="icon" items="${icons}">
                                        <img src="${contextPath}{{ctrl.items.mapParameters.icon2.value}}" alt="">
                                    </c:forEach>
                                </div>--%>

                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name">${name}</h2>
                                <div class="product-inner-price">
                                    <ins>Price: ${price}</ins>
                                    <del></del>
                                </div>

                                <form action="" class="cart">
                                    <div class="quantity">
                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1"
                                               name="quantity" min="1" step="1">
                                    </div>
                                    <button class="add_to_cart_button" type="submit">Add to cart</button>
                                </form>


                                <div role="tabpanel">

                                    <div class="tab-content">
                                        <p role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Product Description</h2>

                                            <p ng-repeat="p in ctrl.items.mapParameters">
                                            <%--<div ng-if="p != 'name' || p != 'icon' || p != 'icon2' || p != 'icon3' ">--%>
                                        <b> {{p.attribute.name}} : </b> {{p.value}} <br/>
                                            <%--</div>--%>
                                        </p>

                                       <%-- <c:forEach var="entry" items="${paramsMap}">
                                            <b> ${entry.key} : </b> ${entry.value} <br/>
                                        </c:forEach>--%>


                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="related-products-wrapper">
                    <h2 class="related-products-title">Related Products</h2>
                    <div class="related-products-carousel">
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-1.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Sony Smart TV - 2015</a></h2>

                            <div class="product-carousel-price">
                                <ins>$700.00</ins>
                                <del>$100.00</del>
                            </div>
                        </div>
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-2.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Apple new mac book 2015 March :P</a></h2>
                            <div class="product-carousel-price">
                                <ins>$899.00</ins>
                                <del>$999.00</del>
                            </div>
                        </div>
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-3.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Apple new i phone 6</a></h2>

                            <div class="product-carousel-price">
                                <ins>$400.00</ins>
                                <del>$425.00</del>
                            </div>
                        </div>
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-4.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Sony playstation microsoft</a></h2>

                            <div class="product-carousel-price">
                                <ins>$200.00</ins>
                                <del>$225.00</del>
                            </div>
                        </div>
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-5.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Sony Smart Air Condtion</a></h2>

                            <div class="product-carousel-price">
                                <ins>$1200.00</ins>
                                <del>$1355.00</del>
                            </div>
                        </div>
                        <div class="single-product">
                            <div class="product-f-image">
                                <img src="${contextPath}/resources/img/product-6.jpg" alt="">
                                <div class="product-hover">
                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to
                                        cart</a>
                                    <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                </div>
                            </div>

                            <h2><a href="">Samsung gallaxy note 4</a></h2>

                            <div class="product-carousel-price">
                                <ins>$400.00</ins>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
