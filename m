Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr680070.outbound.protection.outlook.com ([40.107.68.70]:62997
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725763AbeKQGcx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Nov 2018 01:32:53 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v2 2/2] x86: set a dependency on macros.S
Date: Fri, 16 Nov 2018 20:18:58 +0000
Message-ID: <C359F0E6-2920-428F-B93E-7C76E564C1BA@vmware.com>
References: <20181114204309.18645-1-namit@vmware.com>
 <20181114204309.18645-3-namit@vmware.com>
 <CAK7LNAR30CVQHBTXzY-cFcpa-mw2QSpqUZHEAs7n0Jn64dLBFw@mail.gmail.com>
In-Reply-To: <CAK7LNAR30CVQHBTXzY-cFcpa-mw2QSpqUZHEAs7n0Jn64dLBFw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB0AF2066A1B464A8FF40E7ACA58E272@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQpTZW50OiBOb3ZlbWJlciAxNiwgMjAxOCBhdCA3OjM3OjQ2
IEFNIEdNVA0KPiBUbzogTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4NCj4gQ2M6IEluZ28g
TW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPiwgTWljaGFsIE1hcmVrIDxtaWNoYWwubGttbEBtYXJr
b3ZpLm5ldD4sIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiwgQm9yaXNsYXYg
UGV0a292IDxicEBhbGllbjguZGU+LCBILiBQZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4sIFg4
NiBNTCA8eDg2QGtlcm5lbC5vcmc+LCBMaW51eCBLYnVpbGQgbWFpbGluZyBsaXN0IDxsaW51eC1r
YnVpbGRAdmdlci5rZXJuZWwub3JnPiwgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIHg4
Njogc2V0IGEgZGVwZW5kZW5jeSBvbiBtYWNyb3MuUw0KPiANCj4gDQo+IE9uIFRodSwgTm92IDE1
LCAyMDE4IGF0IDE6MDEgUE0gTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4gd3JvdGU6DQo+
PiBDaGFuZ2VzIGluIG1hY3Jvcy5TIHNob3VsZCB0cmlnZ2VyIHRoZSByZWNvbXBpbGF0aW9uIG9m
IGFsbCBDIGZpbGVzLCBhcw0KPj4gdGhlIG1hY3JvcyBtaWdodCBuZWVkIHRvIGFmZmVjdCB0aGVp
ciBjb21waWxhdGlvbi4NCj4+IA0KPj4gQWNrZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJu
ZWwub3JnPg0KPj4gU2lnbmVkLW9mZi1ieTogTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4N
Cj4+IC0tLQ0KPiANCj4gV2hlbiB3ZSB0YWxrZWQgYWJvdXQgdGhpcyBsYXN0IHRpbWUsDQo+IHdl
IGFncmVlZCB0byBub3QgZG8gdGhpcw0KPiBiZWNhdXNlIGEgc2luZ2xlIGxpbmUgY2hhbmdlIGlu
IGFzbSBoZWFkZXJzDQo+IHdvdWxkIGNhdXNlIGdsb2JhbCByZWJ1aWxkaW5nLg0KPiANCj4gRGlk
IHlvdSBjaGFuZ2UgeW91ciBtaW5kPw0KDQpJIHdhcyB3cm9uZyAoYW5kIHlvdSB3ZXJlIHJpZ2h0
PyBJIGRvbuKAmXQgcXVpdGUgcmVtZW1iZXIpLiBBbnlob3csIGFub3RoZXINCnBhdGNoIEkgd29y
ayBvbiBtYWRlIG1lIHJlYWxpemUgaG93IHdyb25nIEkgd2FzLg0KDQpJZiByZXF1aXJlZCwgd2Ug
Y2FuIGV4dHJhY3QgdGhlIG1hY3JvcyBmcm9tIHNvbWUgb2YgdGhlIGhlYWRlciBmaWxlcyBpbnRv
DQpzZXBhcmF0ZSBoZWFkZXIgZmlsZXMgdG8gcHJldmVudCB1bm5lY2Vzc2FyeSByZWJ1aWxkcy4N
Cg0KVGhhbmtzLA0KTmFkYXY=
