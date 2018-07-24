Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr710085.outbound.protection.outlook.com ([40.107.71.85]:10848
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388469AbeGXTLu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jul 2018 15:11:50 -0400
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v6 1/9] Makefile: Prepare for using macros for inline asm
Date: Tue, 24 Jul 2018 18:04:06 +0000
Message-ID: <A1E263C1-C1DA-4B23-8232-8CF87DDD7A3F@vmware.com>
References: <20180622172212.199633-1-namit@vmware.com>
 <20180622172212.199633-2-namit@vmware.com>
 <CAK7LNASaZd9fupgu4vxc6+tnCnNMdrCi7LTwS56K1LaKODoCtA@mail.gmail.com>
 <20180724111445.GB14212@gmail.com>
In-Reply-To: <20180724111445.GB14212@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE2CB2B0164B394E90AFE56AE56FB9D0@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

YXQgNDoxNCBBTSwgSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+IHdyb3RlOg0KDQo+IA0K
PiAqIE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3Rl
Og0KPiANCj4+IDIwMTgtMDYtMjMgMjoyMiBHTVQrMDk6MDAgTmFkYXYgQW1pdCA8bmFtaXRAdm13
YXJlLmNvbT46DQo+Pj4gVXNpbmcgbWFjcm9zIGZvciBpbmxpbmUgYXNzZW1ibHkgaW1wcm92ZXMg
Ym90aCByZWFkYWJpbGl0eSBhbmQNCj4+PiBjb21waWxhdGlvbiBkZWNpc2lvbnMgdGhhdCBhcmUg
ZGlzdG9ydGVkIGJ5IGJpZyBhc3NlbWJseSBibG9ja3MgdGhhdCB1c2UNCj4+PiBhbHRlcm5hdGl2
ZSBzZWN0aW9ucy4gQ29tcGlsZSBtYWNyb3MuUyBhbmQgdXNlIGl0IHRvIGFzc2VtYmxlIGFsbCBD
DQo+Pj4gZmlsZXMuIEN1cnJlbnRseSwgb25seSB4ODYgd2lsbCB1c2UgaXQuDQo+Pj4gDQo+Pj4g
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+PiBDYzogTWFzYWhpcm8gWWFt
YWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4NCj4+PiBDYzogTWljaGFsIE1hcmVr
IDxtaWNoYWwubGttbEBtYXJrb3ZpLm5ldD4NCj4+PiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+DQo+Pj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0K
Pj4+IENjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPg0KPj4+IENjOiB4ODZAa2Vy
bmVsLm9yZw0KPj4+IENjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnDQo+Pj4gQWNrZWQt
Ynk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3JnPg0KPj4+IFNp
Z25lZC1vZmYtYnk6IE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5jb20+DQo+Pj4gLS0tDQo+PiAN
Cj4+IA0KPj4gDQo+PiBBY2tlZC1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9A
c29jaW9uZXh0LmNvbT4NCj4+IA0KPj4gDQo+PiANCj4+IA0KPj4+IE1ha2VmaWxlICAgICAgICAg
ICAgICAgICB8ICA5ICsrKysrKystLQ0KPj4+IGFyY2gveDg2L01ha2VmaWxlICAgICAgICB8IDEx
ICsrKysrKysrKy0tDQo+Pj4gYXJjaC94ODYva2VybmVsL21hY3Jvcy5TIHwgIDcgKysrKysrKw0K
Pj4+IHNjcmlwdHMvS2J1aWxkLmluY2x1ZGUgICB8ICA0ICsrKy0NCj4+PiBzY3JpcHRzL21vZC9N
YWtlZmlsZSAgICAgfCAgMiArKw0KPj4+IDUgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYva2VybmVs
L21hY3Jvcy5TDQo+IA0KPiBTbyB0aGlzIHBhdGNoIGFwcGVhcnMgdG8gYnJlYWsgdGhlIHh0ZW5z
YSBjcm9zcy1idWlsZCBvbiBteSBzeXN0ZW0sIHdpdGggYW4gb2xkZXIgDQo+IHZlcnNpb24gb2Yg
Y3Jvc3N0b29sczoNCj4gDQo+ICBNT0RQT1NUIHZtbGludXgubw0KPiAvaG9tZS9taW5nby9jcm9z
c3Rvb2wta29yZy9iaW4vL2djYy00LjkuMC1ub2xpYmMveHRlbnNhLWxpbnV4L2Jpbi94dGVuc2Et
bGludXgtbGQ6Li9hcmNoL3h0ZW5zYS9rZXJuZWwvdm1saW51eC5sZHM6NDMwOiANCj4gc3ludGF4
IGVycm9yDQo+IC9ob21lL21pbmdvL3RpcC9NYWtlZmlsZToxMDEwOiByZWNpcGUgZm9yIHRhcmdl
dCAndm1saW51eCcgZmFpbGVkDQo+IG1ha2VbMV06ICoqKiBbdm1saW51eF0gRXJyb3IgMQ0KPiBt
YWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2Rldi9zaG0vdGlwL2J1aWxkJw0KPiBNYWtlZmls
ZToxNDY6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzdWItbWFrZeKAmSBmYWlsZWQNCg0KVGhpcyBvbmUg
aXMgZHVlIHRvIGEgbWlzc2luZyAtRExJTktFUl9TQ1JJUFQgaW4gdGhlIE1ha2VmaWxlIG9mIHh0
ZW5zYS4gSeKAmWxsDQpzZW5kIHRoZSBwYXRjaCB0byBmaXggaXQgYWZ0ZXIgSSBkZWFsIHdpdGgg
dGhlIGJvb3QgZmFpbHVyZSAoZm9yIHdoaWNoIEkNCndhaXQgZm9yIHlvdXIgY29uZmlnIGZpbGUp
Lg0KDQpUaGFua3MsDQpOYWRhdg==
