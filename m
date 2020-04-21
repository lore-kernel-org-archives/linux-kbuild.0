Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vi1eur05on2087.outbound.protection.outlook.com ([40.107.21.87]:61440
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725963AbgDUQae (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 12:30:34 -0400
From: Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Date: Tue, 21 Apr 2020 16:30:29 +0000
Message-ID: <62a51b2e5425a3cca4f7a66e2795b957f237b2da.camel@mellanox.com>
References: <20200417011146.83973-1-saeedm@mellanox.com>
         <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
         <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr>
         <CAK7LNATmPD1R+Ranis2u3yohx8b0+dGKAvFpjg8Eo9yEHRT6zQ@mail.gmail.com>
         <87v9lu1ra6.fsf@intel.com>
         <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com>
         <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <37A07B5FDC630A49B0CE3525C8B569F4@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "nico@fluxnic.net" <nico@fluxnic.net>
Cc: "masahiroy@kernel.org" <masahiroy@kernel.org>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "airlied@linux.ie" <airlied@linux.ie>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "arnd@arndb.de" <arnd@arndb.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "leon@kernel.org" <leon@kernel.org>

T24gVHVlLCAyMDIwLTA0LTIxIGF0IDA5OjU4IC0wNDAwLCBOaWNvbGFzIFBpdHJlIHdyb3RlOg0K
PiBPbiBUdWUsIDIxIEFwciAyMDIwLCBTYWVlZCBNYWhhbWVlZCB3cm90ZToNCj4gDQo+ID4gSSB3
b25kZXIgaG93IG1hbnkgb2YgdGhvc2UgODg4OSBjYXNlcyB3YW50ZWQgYSB3ZWFrIGRlcGVuZGVu
Y3kgYnV0DQo+ID4gY291bGRuJ3QgZmlndXJlIG91dCBob3cgdG8gZG8gaXQgPyANCj4gPiANCj4g
PiBVc2VycyBvZiBkZXBlbmRzIG9uIEZPTyB8fCAhRk9PDQo+ID4gDQo+ID4gJCBnaXQgbHMtZmls
ZXMgfCBncmVwIEtjb25maWcgfCB4YXJncyBncmVwIC1FIFwNCj4gPiAgICJkZXBlbmRzXHMrb25c
cysoW0EtWmEtejAtOV9dKylccypcfFx8XHMqKFwhXHMqXDF8XDFccyo9XHMqbikiIFwNCj4gPiAg
fCB3YyAtbA0KPiA+IA0KPiA+IDE1Ng0KPiA+IA0KPiA+IGEgbmV3IGtleXdvcmQgaXMgcmVxdWly
ZWQgOikgLi4gDQo+ID4gDQo+ID4gDQo+ID4gPiBJbiBhbm90aGVyIG1haWwgSSBzdWdnZXN0ZWQN
Cj4gPiA+IA0KPiA+ID4gCW9wdGlvbmFsbHkgZGVwZW5kcyBvbiBGT08NCj4gPiA+IA0KPiA+ID4g
bWlnaHQgYmUgYSBiZXR0ZXIgYWx0ZXJuYXRpdmUgdGhhbiAidXNlcyIuDQo+ID4gPiANCj4gPiA+
IA0KPiA+IA0KPiA+IGhvdyBhYm91dCBqdXN0Og0KPiA+ICAgICAgIG9wdGlvbmFsIEZPTw0KPiA+
IA0KPiA+IEl0IGlzIGNsZWFyIGFuZCBlYXN5IHRvIGRvY3VtZW50IC4uIA0KPiANCj4gSSBkb24n
dCBkaXNwdXRlIHlvdXIgYXJndW1lbnQgZm9yIGhhdmluZyBhIG5ldyBrZXl3b3JkLiBCdXQgdGhl
IG1vc3QgDQo+IGRpZmZpY3VsdCBwYXJ0IGFzIEFybmQgc2FpZCBpcyB0byBmaW5kIGl0LiBZb3Ug
Y2Fubm90IHByZXRlbmQgdGhhdCANCg0Ka2NvbmZpZy1sYW5ndWFnZS5yc3QgID8NCg0KPiAib3B0
aW9uYWwgRk9PIiBpcyBjbGVhciB3aGVuIGl0IGFjdHVhbGx5IGltcG9zZXMgYSByZXN0cmljdGlv
biB3aGVuIA0KPiBGT089bS4gVHJ5IHRvIGp1c3RpZnkgdG8gcGVvcGxlIHdoeSB0aGV5IGNhbm5v
dCBzZWxlY3QgeSBiZWNhdXNlIG9mDQo+IHRoaXMgDQo+ICJvcHRpb25hbCIgdGhpbmcuDQo+IA0K
DQpUaGVuIGxldCdzIHVzZSAidXNlcyIgaXQgaXMgbW9yZSBhc3NlcnRpdmUuIERvY3VtZW50YXRp
b24gd2lsbCBjb3Zlcg0KYW55IHZhZ3VlIGFueXRoaW5nIGFib3V0IGl0IC4uIA0KDQo+IA0KPiBO
aWNvbGFzDQo=
