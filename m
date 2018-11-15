Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr800078.outbound.protection.outlook.com ([40.107.80.78]:8000
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725895AbeKOMDn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 07:03:43 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Date: Thu, 15 Nov 2018 01:57:52 +0000
Message-ID: <521458D7-A27C-4112-81ED-1974EFE96A76@vmware.com>
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
 <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
 <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
 <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
In-Reply-To: <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <76E9724BC3F0074D925520914DA1C496@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

RnJvbTogTG9nYW4gR3VudGhvcnBlDQpTZW50OiBOb3ZlbWJlciAxNSwgMjAxOCBhdCAxOjE5OjQ1
IEFNIEdNVA0KPiBUbzogTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4sIEluZ28gTW9sbmFy
IDxtaW5nb0BrZXJuZWwub3JnPg0KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+
LCBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiwgTWljaGFs
IE1hcmVrIDxtaWNoYWwubGttbEBtYXJrb3ZpLm5ldD4sIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiwgQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+LCBILiBQZXRlciBB
bnZpbiA8aHBhQHp5dG9yLmNvbT4sIFg4NiBNTCA8eDg2QGtlcm5lbC5vcmc+LCBMaW51eCBLYnVp
bGQgbWFpbGluZyBsaXN0IDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnPiwgTEtNTCA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIE1h
a2VmaWxlOiBGaXggZGlzdGNjIGNvbXBpbGF0aW9uIHdpdGggeDg2IG1hY3Jvcw0KPiANCj4gDQo+
IA0KPiANCj4gT24gMTQvMTEvMTggMTA6NDYgQU0sIE5hZGF2IEFtaXQgd3JvdGU6DQo+PiBBY3R1
YWxseSwgd2UgY2FuIGp1c3QgZmlndXJlIG91dCB3aGV0aGVyIGRpc3RjYyBvciBpY2VjYyBhcmUg
dXNlZCBpbiB0aGUNCj4+IE1ha2VmaWxlIGFjY29yZGluZyB0byB0aGUg4oCcdmVyc2lvbuKAnSwg
c2ltaWxhcmx5IHRvIHRoZSB3YXkgY2xhbmcgaXMgZGV0ZWN0ZWQuDQo+PiBUaGlzIHdvdWxkIG5l
aXRoZXIgcmVxdWlyZSBuZXcgTWFrZWZpbGUgYXJndW1lbnRzIG9yIEtjb25maWcgb3B0aW9ucy4N
Cj4+IA0KPj4gV2hhdCBkbyB5b3Ugc2F5IGFib3V0IHRoZSBmb2xsb3dpbmc/DQo+IA0KPiBUaGF0
IG1heSBiZSBhIGdvb2QgaWRlYSwgYnV0IEkgd2FzIGtpbmQgb2YgaG9waW5nIHRvIGJlIGFibGUg
dG8gYWRkDQo+IHN1cHBvcnQgZm9yIHRoaXMgdG8gYXQgbGVhc3QgYSBmdXR1cmUgdmVyc2lvbiBv
ZiBpY2VjYyAodGhvdWdoIEknbSBub3QNCj4gY29tbWl0dGluZyB0byB0aGF0Li4uKS4gU28gaXQg
d291bGQgYmUgbmljZSB0byBoYXZlIGEgd2F5IHRvIGZvcmNlIGl0DQo+IG9uZSB3YXkgb3IgdGhl
IG90aGVyIHdpdGggYW4gZW52aXJvbm1lbnQgdmFyaWFibGUuDQoNCkFzIGxvbmcgYXMgdGhlIGFy
Z3VtZW50IHdhcyAqcmVxdWlyZWQqIHRvIGdldCBkaXN0Y2MgdG8gd29yayBhdCBhbGwsIHlvdQ0K
Y291bGQgZXhwZWN0IHBlb3BsZSB3b3VsZCBmaWd1cmUgb3V0IGFuIGFyZ3VtZW50IGlzIG5lZWRl
ZC4gSW4gdGhpcyBjYXNlLCBJDQpzdXNwZWN0IG5vYm9keSB3aWxsIGV2ZXIga25vdyBhYm91dCB0
aGlzIGFyZ3VtZW50IChleGNlcHQgeW91KS4NCg0KRXZlbnR1YWxseSwgaWYgeW91IGdldCBhIGZp
eCBpbnRvIGljZWNjLCB3ZSB3aWxsIG5lZWQgdG8gY2hhbmdlIHRoZQ0KTWFrZWZpbGUsIGNvbnNp
ZGVyIHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgYWN0IGFjY29yZGluZ2x5Lg0KDQpBbnlob3csIEni
gJlsbCBhZGQgYW4gYXJndW1lbnQgYXMgeW91IGFza2VkLCBhbmQgbGV0IEluZ28gKCYgb3RoZXJz
KSBiZSB0aGUNCmp1ZGdlKHMpLg0KDQo=
