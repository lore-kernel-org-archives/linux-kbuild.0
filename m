Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr730051.outbound.protection.outlook.com ([40.107.73.51]:64019
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727168AbeKHDcz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 22:32:55 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Wed, 7 Nov 2018 18:01:23 +0000
Message-ID: <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
In-Reply-To: <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <58E16AC9ECF591448DDEDA5E47381D1E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

RnJvbTogTG9nYW4gR3VudGhvcnBlDQpTZW50OiBOb3ZlbWJlciA2LCAyMDE4IGF0IDg6MDE6MzEg
UE0gR01UDQo+IFRvOiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiwgSW5nbyBNb2xuYXIg
PG1pbmdvQHJlZGhhdC5jb20+DQo+IENjOiBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPiwgWDg2IE1MIDx4ODZAa2VybmVsLm9yZz4sIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4sIE1pY2hhbCBNYXJlayA8bWljaGFsLmxrbWxAbWFya292aS5uZXQ+LCBUaG9tYXMgR2xl
aXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4sIEguIFBldGVyIEFudmluIDxocGFAenl0b3IuY29t
PiwgTGludXggS2J1aWxkIG1haWxpbmcgbGlzdCA8bGludXgta2J1aWxkQHZnZXIua2VybmVsLm9y
Zz4sIFN0ZXBoZW4gQmF0ZXMgPHNiYXRlc0ByYWl0aGxpbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjkgMDIvMTBdIE1ha2VmaWxlOiBQcmVwYXJlIGZvciB1c2luZyBtYWNyb3MgZm9yIGlu
bGluZSBhc20NCj4gDQo+IA0KPiANCj4gDQo+IE9uIDIwMTgtMTEtMDYgMTI6MTggcC5tLiwgTmFk
YXYgQW1pdCB3cm90ZToNCj4+IEVyci4uIEkgZG9u4oCZdCBoYXZlIGEgZGlzdC1jYyBlbnZpcm9u
bWVudC4gSSB3b25kZXIgd2hldGhlciBzb21ldGhpbmcgbGlrZQ0KPj4gdGhhdCB3b3VsZCBkbyB0
aGUgdHJpY2s6DQo+IA0KPiBJIHRlc3RlZCBpdCB0byBiZSBzdXJlIC0tIGJ1dCwgbm8sIHRoaXMg
ZG9lcyBub3QgaGF2ZSBhbnkgYWZmZWN0IG9uDQo+IGRpc3RjYy4gRGlzdGNjIHVzdWFsbHkgZG9l
cyBwcmUtcHJvY2Vzc2luZyBsb2NhbGx5IGFuZCB0aGVuIHNlbmRzIHRoZQ0KPiBzaW5nbGUgb3V0
cHV0IG9mIGNwcCB0byBhIHJlbW90ZSBmb3IgY29tcGlsYXRpb24gYW5kIGFzc2VtYmx5LiBJdA0K
PiBkb2Vzbid0IGV4cGVjdCB0aGVyZSB0byBiZSBhZGRpdGlvbmFsIGFzc2VtYmx5IGZpbGVzIHRh
Y2tlZCBvbiB0aGUNCj4gY29tbWFuZCBsaW5lIGFuZCBpc24ndCBnb2luZyB0byBoYW5kbGUgdGhh
dCBjYXNlIGNvcnJlY3RseS4gVGh1cywNCj4gY2hhbmdpbmcgdGhlIHBhdGggb2YgdGhlIGZpbGUg
d29uJ3QgZml4IGFueXRoaW5nLg0KDQpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4NCg0KSSBw
bGF5ZWQgd2l0aCBkaXN0LWNjIGFuZCBnYXZlIGl0IHNvbWUgdGhvdWdodCwgYnV0IEkgZG8gbm90
IGhhdmUgYQ0Kc29sdXRpb24uIEkgdGhvdWdodCB0aGF0IHBlcmhhcHMgc29tZSBoYWNrIGlzIHBv
c3NpYmxlIGJ5IHVzaW5nIHRoZSBzYW1lDQpwcmVwcm9jZXNzZWQgZmlsZSBjYW4gYmUgdXNlZCBh
cyBib3RoIHRoZSBzb3VyY2UgZmlsZSBhbmQgdGhlIGFzc2VtYmx5IGZpbGUsDQpidXQgdGhhdOKA
mXMgYXMgZmFyIGFzIEkgbWFuYWdlZCB0byBnZXQuDQoNCklkZWFzPyBEbyBwZW9wbGUgY2FyZSBh
Ym91dCBpdD8=
