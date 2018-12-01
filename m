Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr690068.outbound.protection.outlook.com ([40.107.69.68]:39546
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeLARlK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Dec 2018 12:41:10 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Date: Sat, 1 Dec 2018 06:29:14 +0000
Message-ID: <0707DBAD-9658-4F5F-894C-A16D66F11CA3@vmware.com>
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
 <1CAF7187-4732-4BC9-8F7F-93EB16ED14E9@vmware.com>
 <7602f831-72db-888b-4b99-14763a2a3ac5@deltatee.com>
In-Reply-To: <7602f831-72db-888b-4b99-14763a2a3ac5@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0D27358B48B5D45A3CA0F016071430B@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

PiBPbiBOb3YgMjksIDIwMTgsIGF0IDg6NDMgQU0sIExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRl
bHRhdGVlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIwMTgtMTEtMjggNjozMSBwLm0u
LCBOYWRhdiBBbWl0IHdyb3RlOg0KPj4+IE9uIE5vdiAyOCwgMjAxOCwgYXQgNDo0OSBQTSwgTG9n
YW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPiB3cm90ZToNCj4+PiANCj4+PiANCj4+
PiANCj4+PiBPbiAyMDE4LTExLTI4IDU6MzggcC5tLiwgTmFkYXYgQW1pdCB3cm90ZToNCj4+Pj4g
U28gd2hhdOKAmXMgeW91ciB0YWtlPyBXb3VsZCB5b3UgdGhpbmsgdGhpcyBwYXRjaCBpcyBzdGls
bCBuZWVkZWQ/IFNob3VsZCBpdA0KPj4+PiBvbmx5IGJlIGVuYWJsZWQgYXV0b21hdGljYWxseSBm
b3IgZGlzdGNjIGFuZCBub3QgZm9yIGRpc3RjYy1wdW1wPw0KPj4+IA0KPj4+IE5vdCBzdXJlLiBU
aGUgcGF0Y2ggd2lsbCBwcm9iYWJseSBzbG93IHRoaW5ncyBkb3duIGEgbG90IChzZWVpbmcNCj4+
PiBhc3NlbWJseSBpcyBhbHdheXMgZG9uZSBsb2NhbGx5IGFuZCB0aGVyZSBhcmUgdHdpY2UgYXMg
bWFueSBjb21waWxlDQo+Pj4gc3RlcHMpIGFuZCB3aWxsIGNyZWF0ZSBzb21lIGNvbmZ1c2lvbiBv
bmNlIGl0J3MgcG9zc2libGUgdG8gZGlzYWJsZSBpdA0KPj4+IGZvciB0aGUgbmV3IHZlcnNpb25z
LiBNYXliZSBob2xkIG9mZiBhbmQgc2VlIGlmIGFueW9uZSBlbHNlIGNvbXBsYWlucz8NCj4+PiAN
Cj4+PiBJIGRvbid0IHJlYWxseSBrbm93IGhvdyB5b3UnZCBkZXRlY3Qgd2hldGhlciBwdW1wIGlz
IGluIHVzZSBvciBub3QgYW5kDQo+Pj4gSSdtIHVuY2VydGFpbiBhcyB0byB3aGV0aGVyIGFueSBv
ZiB0aGUgYXV0byBkZXRlY3Rpb24gY2FuIGFjdHVhbGx5IGJlDQo+Pj4gbWFkZSB0byBiZSByZWxp
YWJsZS4NCj4+IA0KPj4gQSBzaWxseSBgJChDQykg4oCUdmVyc2lvbiB8IGdyZXAgcHVtcCBgIHRl
c3QuDQo+IA0KPiBBY3R1YWxseSBJJ20gbm90IHN1cmUgdGhhdCdzIGdvaW5nIHRvIHdvcmsgaW4g
YWxsIGNhc2VzLiBJZiBDQz0iZGlzdGNjDQo+IGdjYyIsIHRoZW4gIiQoQ0MpIC0tdmVyc2lvbiIg
anVzdCBsb29rcyBsaWtlICJnY2MgLS12ZXJzaW9uIi4uLg0KDQpFcnIuLiBZb3XigJlyZSByaWdo
dC4gSSBqdXN0IHRyaWVkIGRpc3RjYyAtLXZlcnNpb24uDQoNCg==
