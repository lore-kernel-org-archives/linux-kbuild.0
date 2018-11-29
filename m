Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr810071.outbound.protection.outlook.com ([40.107.81.71]:39072
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726786AbeK2MfI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Nov 2018 07:35:08 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Date: Thu, 29 Nov 2018 01:31:27 +0000
Message-ID: <1CAF7187-4732-4BC9-8F7F-93EB16ED14E9@vmware.com>
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
 <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
 <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
 <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
 <521458D7-A27C-4112-81ED-1974EFE96A76@vmware.com>
 <be24a6eb-ebf0-8d9f-0051-681f0da66109@deltatee.com>
 <5682CCB4-B7D3-4DDC-81BB-2D4DCE968A3D@vmware.com>
 <336cf7d8-6495-b112-8d3a-c146222fda78@deltatee.com>
In-Reply-To: <336cf7d8-6495-b112-8d3a-c146222fda78@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <51092CDFA830E44589A437910A7D3571@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

PiBPbiBOb3YgMjgsIDIwMTgsIGF0IDQ6NDkgUE0sIExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRl
bHRhdGVlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIwMTgtMTEtMjggNTozOCBwLm0u
LCBOYWRhdiBBbWl0IHdyb3RlOg0KPj4gU28gd2hhdOKAmXMgeW91ciB0YWtlPyBXb3VsZCB5b3Ug
dGhpbmsgdGhpcyBwYXRjaCBpcyBzdGlsbCBuZWVkZWQ/IFNob3VsZCBpdA0KPj4gb25seSBiZSBl
bmFibGVkIGF1dG9tYXRpY2FsbHkgZm9yIGRpc3RjYyBhbmQgbm90IGZvciBkaXN0Y2MtcHVtcD8N
Cj4gDQo+IE5vdCBzdXJlLiBUaGUgcGF0Y2ggd2lsbCBwcm9iYWJseSBzbG93IHRoaW5ncyBkb3du
IGEgbG90IChzZWVpbmcNCj4gYXNzZW1ibHkgaXMgYWx3YXlzIGRvbmUgbG9jYWxseSBhbmQgdGhl
cmUgYXJlIHR3aWNlIGFzIG1hbnkgY29tcGlsZQ0KPiBzdGVwcykgYW5kIHdpbGwgY3JlYXRlIHNv
bWUgY29uZnVzaW9uIG9uY2UgaXQncyBwb3NzaWJsZSB0byBkaXNhYmxlIGl0DQo+IGZvciB0aGUg
bmV3IHZlcnNpb25zLiBNYXliZSBob2xkIG9mZiBhbmQgc2VlIGlmIGFueW9uZSBlbHNlIGNvbXBs
YWlucz8NCj4gDQo+IEkgZG9uJ3QgcmVhbGx5IGtub3cgaG93IHlvdSdkIGRldGVjdCB3aGV0aGVy
IHB1bXAgaXMgaW4gdXNlIG9yIG5vdCBhbmQNCj4gSSdtIHVuY2VydGFpbiBhcyB0byB3aGV0aGVy
IGFueSBvZiB0aGUgYXV0byBkZXRlY3Rpb24gY2FuIGFjdHVhbGx5IGJlDQo+IG1hZGUgdG8gYmUg
cmVsaWFibGUuDQoNCkEgc2lsbHkgYCQoQ0MpIOKAlHZlcnNpb24gfCBncmVwIHB1bXAgYCB0ZXN0
Lg0KDQpBbnlob3csIGl0IGlzIHVwIHRvIE1hc2FoaXJvLg0KDQo=
