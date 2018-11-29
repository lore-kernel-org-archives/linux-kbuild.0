Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr680042.outbound.protection.outlook.com ([40.107.68.42]:38119
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726788AbeK2Llj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Nov 2018 06:41:39 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Date: Thu, 29 Nov 2018 00:38:07 +0000
Message-ID: <5682CCB4-B7D3-4DDC-81BB-2D4DCE968A3D@vmware.com>
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
 <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
 <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
 <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
 <521458D7-A27C-4112-81ED-1974EFE96A76@vmware.com>
 <be24a6eb-ebf0-8d9f-0051-681f0da66109@deltatee.com>
In-Reply-To: <be24a6eb-ebf0-8d9f-0051-681f0da66109@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <42B69C23C1F7F84D9B7DD0F4DC845762@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

PiBPbiBOb3YgMjgsIDIwMTgsIGF0IDM6MDkgUE0sIExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRl
bHRhdGVlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIwMTgtMTEtMTQgNjo1NyBwLm0u
LCBOYWRhdiBBbWl0IHdyb3RlOg0KPj4gRXZlbnR1YWxseSwgaWYgeW91IGdldCBhIGZpeCBpbnRv
IGljZWNjLCB3ZSB3aWxsIG5lZWQgdG8gY2hhbmdlIHRoZQ0KPj4gTWFrZWZpbGUsIGNvbnNpZGVy
IHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgYWN0IGFjY29yZGluZ2x5Lg0KPiANCj4gSSBnb3QgYSBm
aXggcHVsbGVkIGludG8gaWNlY2NbMV0gYW5kIGl0IHdvcmtzIHF1aXRlIHdlbGwuIEl0IG91Z2h0
IHRvIGJlDQo+IGluY2x1ZGVkIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgaWNlY2MuIEFuZCBkaXN0
Y2MgKHdpdGggcHVtcCBhdCBsZWFzdCkNCj4gaGFzIGEgcGF0Y2ggdG9vLiBJbiBteSBleHBlcmll
bmNlLCBpY2VjYyBkb2VzIGEgbXVjaCBiZXR0ZXIgam9iDQo+IGRpc3RyaWJ1dGluZyB0aGUga2Vy
bmVsIGJ1aWxkIHRob3VnaC4NCj4gDQo+IExvZ2FuDQo+IA0KPiBbMV0gaHR0cHM6Ly9uYTAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIu
Y29tJTJGaWNlY2MlMkZpY2VjcmVhbSUyRnB1bGwlMkY0MzAmYW1wO2RhdGE9MDIlN0MwMSU3Q25h
bWl0JTQwdm13YXJlLmNvbSU3QzA0NGQ3OTViZTMwMTQzYWUyNmVmMDhkNjU1ODY5NTNiJTdDYjM5
MTM4Y2EzY2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzNjc5MDQzMzg4NDIyMjYz
NSZhbXA7c2RhdGE9NGg3MnlManZPRjI5a2NBQzVDTTdDQjl1a0gzSG9BTE5VZmdLQTYyRTRHcyUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KDQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIGl0LiBUaGlzIGNo
YW5nZSBpcyBjZXJ0YWlubHkgc2ltcGxlciBhbmQgY2xlYW5lcg0KdGhhbiB0aGUgb25lIEkgY2Ft
ZSB3aXRoLg0KDQpTbyB3aGF04oCZcyB5b3VyIHRha2U/IFdvdWxkIHlvdSB0aGluayB0aGlzIHBh
dGNoIGlzIHN0aWxsIG5lZWRlZD8gU2hvdWxkIGl0DQpvbmx5IGJlIGVuYWJsZWQgYXV0b21hdGlj
YWxseSBmb3IgZGlzdGNjIGFuZCBub3QgZm9yIGRpc3RjYy1wdW1wPw0KDQo=
