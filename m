Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:25366 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751389AbeFVN0o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 09:26:44 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Date: Fri, 22 Jun 2018 13:26:40 +0000
Message-ID: <TY1PR01MB1562AFD0C247CA1A30957B1D8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180618141905.7789-1-gerg@linux-m68k.org>
 <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <TY1PR01MB1562B232625397CCACD5931A8A760@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXPiDGg+S3VQutSYSBwBbjW_wV+nTSBHuu7a3VNTghm1A@mail.gmail.com>
In-Reply-To: <CAMuHMdXPiDGg+S3VQutSYSBwBbjW_wV+nTSBHuu7a3VNTghm1A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgSnVuZSAyMiwgMjAxOCwgR2VlcnQgVXl0dGVyaG9ldmVu
IHdyb3RlOg0KPiA+IDEpIE1vZGlmeSBrYnVpbGQgdG8gZ2l2ZSB0aGUgYWJpbGl0eSBhcyBzdGF0
ZWQgYWJvdmUuDQo+IA0KPiBXb3VsZCB0aGF0IGFjdHVhbGx5IGhlbHAsIG9yIHdvdWxkIGl0IG9u
bHkgZ2l2ZSB5b3UgYSBmYWxzZSBmZWVsaW5nIG9mDQo+IHNhZmV0eT8NCg0KWXVwIQ0KQnV0IEkg
ZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgc2FmdHkuIEkganVzdCB3YW50IHRvIGJlIGFibGUgdG8g
YnVpbGQgbXkgaW1hZ2VzIHdpdGhvdXQgaGF2aW5nIHRvIGhhY2sgS2NvbmZpZy4NCg0KDQo+IENv
bmNsdXNpb246IElmIHlvdSB3YW50IE5PTU1VIGFuZC9vciBYSVAsIHlvdSBoYXZlIHRvIGtub3cg
d2hhdCB5b3UncmUNCj4gZG9pbmcsDQo+IGFuZCBoYW5kLWhvbGRpbmcgYXQgd2hhdGV2ZXIgbGV2
ZWwgbWF5IG5vdCBzYXZlIHlvdSBmcm9tIG1ha2luZyBtaXN0YWtlcy4NCg0KSSBhZ3JlZS4NCkFu
ZCwgeW91J2xsIHJlcXVpcmUgeW91ciBvd24ga2VybmVsIGNvbmZpZyBpbiBvcmRlciB0byBjdXQg
b3V0IGFsbCB0aGUgDQpleHRyYSBzdHVmZiB0aGF0IHlvdXIgc3lzdGVtIGRvZXNuJ3QgbmVlZC4N
Cg0KDQo+ID4gMikgTWFrZSBYSVAgYnVpbGRzIHNvbWVob3cgYmUgYWJsZSB0byBydW4gYXQgbXVs
dGlwbGUgcGh5c2ljYWwgYWRkcmVzcw0KPiA+IGJ5IG1vZGlmeWluZyB0aGUgYmluYXJpZXMgcG9z
dC1idWlsZCAoQXJuZCdzIHN1Z2dlc3Rpb24pLg0KPiANCj4gVGhhdCdzIGFjdHVhbGx5IGFuIGlu
dGVyZXN0aW5nIG9uZTogbm8gbWFudWFsIGNvbmZpZ3VyYXRpb24gKGlmZg0KPiBwYXJhbWV0ZXJz
DQo+IHdvdWxkIGJlIGV4dHJhY3RlZCBmcm9tIHRoZSBEVEIpLCBzbyBub3RoaW5nIGNhbiBnbyB3
cm9uZyA7LSkNCj4gSSBndWVzcyBpdCBhcHBsaWVzIHRvIE5PTU1VLCB0b28uDQoNCkZvciB0aGUg
aGFyZCBjb2RlZCBtZW1vcnkgYWRkcmVzcywgaXQncyBvbmx5IG5lZWQgYXQgdGhlIHZlcnkgYmVn
aW5uaW5nIA0Kb2YgYm9vdCBpbiBvcmRlciB0byBzZXQgdXAgYSB0ZW1wb3Jhcnkgc3RhY2ssIGJ1
dCBzb29uIHRoZSBEVEIgaXMgcmVhZCANCmFuZCBsaWZlIGlzIGdvb2QuIFNvIGluIHRoZW9yeSwg
dGhlIG1lbW9yeSBhZGRyZXNzIGNvdWxkIGJlIHBhc3NlZCBpbiANCndpdGggYSByZWdpc3Rlci4N
Cg0KRm9yIHRoZSBoYXJkIGNvZGVkIFJPTSBhZGRyZXNzLCB0aGF0IG5lZWRzIHRvIGJlIGF2YWls
YWJsZSBhdCBydW4gdGltZSANCmluIG9yZGVyIHRvIGRvIHRoZSB2aXJ0X3RvX3BoeXMgdHJhbnNs
YXRpb24uIEJ1dCwgdGhlIGlkZWEgaXMgdG8gY2hhbmdlIA0KdGhhdCBmcm9tIGEgI2RlZmluZSB0
byBhIGdsb2JhbCB2YXJpYWJsZS4NCg0KSXQgc291bmRlZCBsaWtlIGl0IG1pZ2h0IHdvcmsuLi5h
bHRob3VnaCBJIG5ldmVyIGdvdCBhcm91bmQgdG8gaGFja2luZyANCnRoZSBjb2RlIHRvIHNlZSBp
ZiBpdCB3b3VsZCBvciBub3QgYmVjYXVzZSBhdCB0aGUgZW5kIG9mIHRoZSBkYXksIGl0IA0KZGlk
bid0IHByb3ZpZGUgYW55IHJlYWwgdmFsdWUgdG8gYWIgWElQIExpbnV4IHN5c3RlbS4NCg0KDQpD
aHJpcw0K
