Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:18256
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725768AbfA3NQ4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jan 2019 08:16:56 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/3] kbuild: Add wilddt function instead of listing dtbs
Date: Wed, 30 Jan 2019 13:16:52 +0000
Message-ID: <b6317087abfa81b37b0ac800b192f8e32786ce9a.camel@nxp.com>
References: <cover.1546888138.git.leonard.crestez@nxp.com>
         <VI1PR04MB553355D6D5EBC2604E1AD256EE9F0@VI1PR04MB5533.eurprd04.prod.outlook.com>
         <CAK7LNAQ+eNhkfNsjGEdAg+j2ButQ8R6NyZ10SckCGSP5MZ4jtg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ+eNhkfNsjGEdAg+j2ButQ8R6NyZ10SckCGSP5MZ4jtg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EF3BD6963F2A741B9D919888AC0468B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "olof@lixom.net" <olof@lixom.net>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

T24gRnJpLCAyMDE5LTAxLTI1IGF0IDAxOjAzICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
DQo+IE9uIFR1ZSwgSmFuIDIyLCAyMDE5IGF0IDE6MTcgQU0gTGVvbmFyZCBDcmVzdGV6IDxsZW9u
YXJkLmNyZXN0ZXpAbnhwLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gMS83LzIwMTkgOTozMSBQ
TSwgTGVvbmFyZCBDcmVzdGV6IHdyb3RlOg0KPiA+ID4gVGhlIGR0cyBtYWtlZmlsZXMgZ28gdGhy
b3VnaCBhIGxvdCBvZiBwb2ludGxlc3MgY2h1cm4gd2hlbiBib2FyZHMgYXJlDQo+ID4gPiBhZGRl
ZC4gTWFueSBTT0NzIChzdWNoIGFzIGlteCkgaGF2ZSB2ZXJ5IHNpbXBsZSBuYW1pbmcgY29udmVu
dGlvbnMgZm9yDQo+ID4gPiBhbGwgYm9hcmRzIHVzaW5nIGEgY2VydGFpbiBjaGlwIGFuZCBib2Fy
ZCBsaXN0aW5ncyBjYW4gYmUgZWFzaWx5DQo+ID4gPiBjb2xsYXBzZWQgdXNpbmcgd2lsZGNhcmRz
Lg0KPiA+ID4gDQo+ID4gPiBBZGQgYSAid2lsZGR0IiBmdW5jdGlvbiBhbmQgdXNlIGl0IGZvciBp
bXg2LzcvOCBhbmQgbGF5ZXJzY2FwZS4gVGhpcyBjYW4NCj4gPiA+IGJlIGFwcGxpZWQgdG8gbWFu
eSBvdGhlciBzb2MgZmFtaWxpZXMgbGF0ZXIuDQo+ID4gDQo+ID4gQW55IGZlZWRiYWNrPyBUaGlz
IHNob3VsZCBiZSByZXZpZXdlZCBieSBrYnVpbGQgYW5kIGFybS1zb2MNCj4gDQo+IFBlcnNvbmFs
bHksIEkgcHJlZmVyIGV4cGxpY2l0IGxpc3RpbmcNCj4gYmVjYXVzZSBJIGNhbiBicm93c2UgdGhl
IE1ha2VmaWxlIHRvIGdldCBhIHF1aWNrIGlkZWENCj4gb2Ygd2hpY2ggYm9hcmRzIGFyZSBjb21w
aWxlZC4NCg0KT3IgeW91IGNhbiBqdXN0IGxzIHNvYy0qLmR0cz8NCg0KPiBJIGxpa2UgdGhpcyB0
byBiZSBjb25zaXN0ZW50Lg0KPiAtIEV4cGxvaXQgd2lsZGNhcmQgZm9yIGFsbCBwbGF0Zm9ybXMN
Cj4gLSBEbyBub3QgZG8gdGhpcyBhdCBhbGwNCj4gDQo+IEJ1dCwgSSBhbSBwZXNzaW1pc3RpYyBh
Ym91dCB0aGUgZm9ybWVyDQo+IHdoZW4gSSBsb29rIGF0IEFUOTEgcGxhdGZvcm0uDQoNCkkgY2Fu
IHRyeSB0byByZXNlbmQgaW4gYSBmb3JtIHRoYXQgdXNlcyBhIHdpbGRjYXJkIGZvciBtb3N0IHBs
YXRmb3Jtcw0KYnV0IHNraXBzIHRob3NlIHdpdGggdmVyeSBmZXcgU09DcyBvciBjb25mdXNpbmcg
Y29udmVudGlvbnMgKGxpa2UNCmF0OTEpLg0KDQotLQ0KUmVnYXJkcywNCkxlb25hcmQNCg==
