Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr710040.outbound.protection.outlook.com ([40.107.71.40]:13370
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbeKIFzc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 00:55:32 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Thu, 8 Nov 2018 20:18:25 +0000
Message-ID: <C0187502-9FC0-4FE2-BCD3-81B8B992F3A2@vmware.com>
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
 <080748A5-2588-47C9-BC2A-E643630FB9A7@vmware.com>
 <3ae6dd1f-9b59-8552-f438-c40b08771226@deltatee.com>
In-Reply-To: <3ae6dd1f-9b59-8552-f438-c40b08771226@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F756A7191AF4D42AFB3ECE9DCCB318F@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, "hpa@zytor.com" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

RnJvbTogTG9nYW4gR3VudGhvcnBlDQpTZW50OiBOb3ZlbWJlciA4LCAyMDE4IGF0IDg6MDA6MzMg
UE0gR01UDQo+IFRvOiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiwgaHBhQHp5dG9yLmNv
bSA8aHBhQHp5dG9yLmNvbT4sIEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0KPiBDYzog
TEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sIFg4NiBNTCA8eDg2QGtlcm5lbC5v
cmc+LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCBNaWNoYWwgTWFyZWsgPG1pY2hh
bC5sa21sQG1hcmtvdmkubmV0PiwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
LCBMaW51eCBLYnVpbGQgbWFpbGluZyBsaXN0IDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3Jn
PiwgU3RlcGhlbiBCYXRlcyA8c2JhdGVzQHJhaXRobGluLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2OSAwMi8xMF0gTWFrZWZpbGU6IFByZXBhcmUgZm9yIHVzaW5nIG1hY3JvcyBmb3IgaW5s
aW5lIGFzbQ0KPiANCj4gDQo+IA0KPiANCj4gT24gMjAxOC0xMS0wOCAxMjo1NCBwLm0uLCBOYWRh
diBBbWl0IHdyb3RlOg0KPj4gSSBkb27igJl0IHRoaW5rIHRoZSBhc3NlbWJseSBzdGFnZSBuZWVk
cyB0byBiZSBkb25lIGxvY2FsbHkuIGdjYyBjYW4gc3RpbGwgYmUNCj4+IHVzZWQgdG8gZGVwbG95
IHRoZSBhc3NlbWJsZXIuIEkgYW0gbm90IHRvbyBmYW1pbGlhciB3aXRoIGRpc3RjYywgc28gSSBk
b27igJl0DQo+PiBrbm93IHdoZXRoZXIgdGhlIHByZXByb2Nlc3Npbmcgc3VwcG9ydHMgbXVsdGlw
bGUgc291cmNlLWZpbGVzLCBhbmQgd2hldGhlcg0KPj4gaXQgaGFzIHNvbWUgc3RyYW5nZS1iZWhh
dmlvciB3aGVuIGl0IGNvbWVzIHRvIC5TLy5zIGZpbGVzLg0KPiANCj4gVGhlIHByb2JsZW0gaXMg
dGhhdCBpdCdzIHRoZSBhc3NlbWJseSBzdGFnZSB0aGF0IG5lZWRzIHRoZSBleHRyYQ0KPiBtYWNy
b3MucyBhbmQgd2l0aG91dCB0aGF0IGZpbGUgYmVpbmcgdHJhbnNmZXJyZWQgc29tZWhvdywgdGhh
dCBzdGFnZQ0KPiBtdXN0IGJlIGRvbmUgbG9jYWxseS4NCg0KSSB1bmRlcnN0YW5kLCBidXQgdGhl
IGlkZWEgaXMgdG8gaGF2ZSB0d28gc3RhZ2VzLCBmb3IgaW5zdGFuY2U6DQoNCiAgZ2NjIC4uLiAt
UyAtbyAudG1wX1t1bml0XS5TIFt1bml0XS5jDQoNCmFuZCB0aGVuDQoNCiAgZ2NjIC4uLiAtRF9f
QVNTRU1CTFlfXyBhcmNoL3g4Ni9rZXJuZWwvbWFjcm9zLlMgLnRtcF9bdW5pdF0uUw0KDQooWWVz
LCBJIHJlYWxpemUgdGhlIC50bXBfW3VuaXRdLlMgd2FzIGFscmVhZHkgcHJlcHJvY2Vzc2VkLCBi
dXQgdGhpcyB3YXkgeW91DQpjYW4gY29tYmluZSBib3RoIGlucHV0cykNCg0KVW5mb3J0dW5hdGVs
eSwgYXMgSSB3cml0ZSB0aGlzIGVtYWlsIChhbmQgcnVuIHRlc3RzKSBJIHJlYWxpemUgZGlzdGNj
IGlzIHRvbw0KZHVtYiB0byBoYW5kbGUgdHdvIGlucHV0IGZpbGVzOg0KDQogICIoZGNjX3NjYW5f
YXJncykgZG8gd2UgaGF2ZSB0d28gaW5wdXRzPyAgaSBnaXZlIHVwICINCg0KSnVzdCBncmVhdC4g
U28gSSBndWVzcyBtYWNyb3MucyB3b3VsZCBuZWVkIHRvIGJlIGNvbmNhdGVuYXRlZCB3aXRoDQou
dG1wX1t1bml0XS5zIGFzIGEgc2VwYXJhdGUgKGxvY2FsKSBpbnRlcmltIHN0YWdlLg0KDQo=
