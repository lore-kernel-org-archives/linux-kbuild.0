Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr740055.outbound.protection.outlook.com ([40.107.74.55]:6690
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726140AbeKIFb2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 00:31:28 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Thu, 8 Nov 2018 19:54:22 +0000
Message-ID: <080748A5-2588-47C9-BC2A-E643630FB9A7@vmware.com>
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
 <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
 <7bc80811-8ab3-d26a-6fb3-b7aeebcfce43@deltatee.com>
 <85B77A64-5FF3-4B82-8A07-E045E259C985@zytor.com>
 <3B824A03-AB76-4B34-B1CA-F27C0F1B0575@vmware.com>
 <2c022676-9299-bb5f-023b-5c114cd79f81@deltatee.com>
In-Reply-To: <2c022676-9299-bb5f-023b-5c114cd79f81@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <12F5485F1E903D4CB4E7F8EFC9A3B29E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, "hpa@zytor.com" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

RnJvbTogTG9nYW4gR3VudGhvcnBlDQpTZW50OiBOb3ZlbWJlciA4LCAyMDE4IGF0IDU6MTQ6NTgg
UE0gR01UDQo+IFRvOiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiwgaHBhQHp5dG9yLmNv
bSA8aHBhQHp5dG9yLmNvbT4sIEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0KPiBDYzog
TEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sIFg4NiBNTCA8eDg2QGtlcm5lbC5v
cmc+LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCBNaWNoYWwgTWFyZWsgPG1pY2hh
bC5sa21sQG1hcmtvdmkubmV0PiwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
LCBMaW51eCBLYnVpbGQgbWFpbGluZyBsaXN0IDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3Jn
PiwgU3RlcGhlbiBCYXRlcyA8c2JhdGVzQHJhaXRobGluLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2OSAwMi8xMF0gTWFrZWZpbGU6IFByZXBhcmUgZm9yIHVzaW5nIG1hY3JvcyBmb3IgaW5s
aW5lIGFzbQ0KPiANCj4gDQo+IA0KPiANCj4gT24gMjAxOC0xMS0wNyAxMToxOCBwLm0uLCBOYWRh
diBBbWl0IHdyb3RlOg0KPj4+IEFwcGFyZW50bHkgZ2NjIHdpbGwgdHJlYXQgdGhlbSBsaWtlIGJh
c2ljIGJsb2NrcyBhbmQgcG9zc2libHkgbW92ZSB0aGVtIGFyb3VuZC4NCj4+IA0KPj4gTWF5YmUg
aXQgaXMgcG9zc2libGUgdG8gYnJlYWsgdGhlIGNvbXBpbGF0aW9uIG9mIGVhY2ggb2JqZWN0IGlu
dG8gdHdvDQo+PiBzdGFnZXM6IGZpcnN0LCBjb21waWxlIHRoZSBzb3VyY2Ugd2l0aG91dCBhc3Nl
bWJseSwgYW5kIHRoZW4gdGFrZSB0aGUNCj4+IGdlbmVyYXRlZCAucyBmaWxlIGFuZCBhc3NlbWJs
ZSBpdCB3aXRoIHRoZSAucyBmaWxlIG9mIHRoZSBtYWNyb3MuDQo+PiANCj4+IERvZXMgaXQgc291
bmRzIGFzIHNvbWV0aGluZyB0aGF0IG1heSB3b3JrPyBJIGd1ZXNzIGl0IHNob3VsZCBvbmx5IGJl
IGRvbmUNCj4+IHdoZW4gZGlzdGNjIGlzIHVzZWQuDQo+IA0KPiBJbiB0aGVvcnkgaXQgd291bGQg
YXQgbGVhc3QgYWxsb3cgdGhlIGNvbXBpbGUgc3RlcCB0byBiZSBkaXN0cmlidXRlZCwNCj4gdGhl
IGFzc2VtYmx5IHN0ZXAgd291bGQgc3RpbGwgaGF2ZSB0byBiZSBkb25lIGxvY2FsbHkuLi4gSXQn
ZCBiZSBiZXR0ZXINCj4gdGhhbiBub3RoaW5nLCBJIGd1ZXNzLg0KDQpJIGRvbuKAmXQgdGhpbmsg
dGhlIGFzc2VtYmx5IHN0YWdlIG5lZWRzIHRvIGJlIGRvbmUgbG9jYWxseS4gZ2NjIGNhbiBzdGls
bCBiZQ0KdXNlZCB0byBkZXBsb3kgdGhlIGFzc2VtYmxlci4gSSBhbSBub3QgdG9vIGZhbWlsaWFy
IHdpdGggZGlzdGNjLCBzbyBJIGRvbuKAmXQNCmtub3cgd2hldGhlciB0aGUgcHJlcHJvY2Vzc2lu
ZyBzdXBwb3J0cyBtdWx0aXBsZSBzb3VyY2UtZmlsZXMsIGFuZCB3aGV0aGVyDQppdCBoYXMgc29t
ZSBzdHJhbmdlLWJlaGF2aW9yIHdoZW4gaXQgY29tZXMgdG8gLlMvLnMgZmlsZXMuDQoNCldlbGws
IEnigJlsbCBnaXZlIGl0IGEgdHJ5Lg0KDQo=
