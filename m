Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:4834 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI0XX6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 19:23:58 -0400
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Date: Fri, 27 Sep 2019 23:23:56 +0000
Message-ID: <02874ECE860811409154E81DA85FBB58968DBE40@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
In-Reply-To: <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYW5keSBEdW5sYXAgW21haWx0
bzpyZHVubGFwQGluZnJhZGVhZC5vcmddDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3LCAy
MDE5IDQ6MTIgUE0NCj4gVG86IEtlbGxlciwgSmFjb2IgRSA8amFjb2IuZS5rZWxsZXJAaW50ZWwu
Y29tPg0KPiBDYzogaW50ZWwtd2lyZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtidWlsZCA8bGludXgtDQo+IGtidWlsZEB2Z2VyLmtl
cm5lbC5vcmc+OyBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBuYW1lc3BhY2U6IGZpeCBuYW1lc3BhY2UucGwgc2Ny
aXB0IHRvIHN1cHBvcnQgcmVsYXRpdmUgcGF0aHMNCj4gDQo+IA0KPiByZTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDE5MDEyOTIwNDMxOS4xNTIzOC0xLWphY29iLmUua2VsbGVyQGlu
dGVsLmNvbS8NCj4gDQo+IERpZCBhbnl0aGluZyBoYXBwZW4gd2l0aCB0aGlzIHBhdGNoPw0KPiAN
Cg0KSSBoYXZlbid0IGhlYXJkIGFueXRoaW5nIG9yIHNlZW4gaXQgZ2V0IGFwcGxpZWQuDQoNCj4g
UGxlYXNlIHNlbmQgaXQgdG8gbGludXgta2J1aWxkQHZnZXIua2VybmVsLm9yZyBhbmQNCj4gQ2M6
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+IA0KDQpT
dXJlLCBJIGNhbiBmb3J3YXJkIGl0Lg0KDQo+IFlvdSBjYW4gYWxzbyBhZGQ6DQo+IEFja2VkLWJ5
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gVGVzdGVkLWJ5OiBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gDQo+IA0KPiBJIHdhcyBqdXN0IGFi
b3V0IHRvIGZpeCB0aGlzIHNjcmlwdCBidXQgSSBkZWNpZGVkIHRvIGZpcnN0IHNlZSBpZiBhbnlv
bmUgZWxzZQ0KPiBoYWQgYWxyZWFkeSBkb25lIHNvLiAgVGhhbmtzLg0KPiANCg0KVGhhbmtzIGZv
ciB0aGUgcmV2aWV3L25vdGljZSBoZXJlLg0KDQo+IC0tDQo+IH5SYW5keQ0KDQotSmFrZQ0K
