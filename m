Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-co1nam03on0087.outbound.protection.outlook.com ([104.47.40.87]:23637
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388320AbeKGEo4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Nov 2018 23:44:56 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Tue, 6 Nov 2018 19:18:10 +0000
Message-ID: <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
In-Reply-To: <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAE7421B1337784A9326978E4229FDD8@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

RnJvbTogTG9nYW4gR3VudGhvcnBlDQpTZW50OiBOb3ZlbWJlciA2LCAyMDE4IGF0IDY6NTc6NTcg
UE0gR01UDQo+IFRvOiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiwgSW5nbyBNb2xuYXIg
PG1pbmdvQHJlZGhhdC5jb20+DQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwg
eDg2QGtlcm5lbC5vcmc+LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCBNaWNoYWwg
TWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmkubmV0PiwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+LCBILiBQZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4sIGxpbnV4LWtidWls
ZEB2Z2VyLmtlcm5lbC5vcmc+LCBTdGVwaGVuIEJhdGVzIDxzYmF0ZXNAcmFpdGhsaW4uY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDAyLzEwXSBNYWtlZmlsZTogUHJlcGFyZSBmb3IgdXNp
bmcgbWFjcm9zIGZvciBpbmxpbmUgYXNtDQo+IA0KPiANCj4gDQo+IA0KPiBPbiAyMDE4LTEwLTAz
IDM6MzAgcC5tLiwgTmFkYXYgQW1pdCB3cm90ZToNCj4+ICtBU01fTUFDUk9fRkxBR1MgPSAtV2Es
YXJjaC94ODYva2VybmVsL21hY3Jvcy5zIC1XYSwtDQo+PiArZXhwb3J0IEFTTV9NQUNST19GTEFH
Uw0KPj4gK0tCVUlMRF9DRkxBR1MgKz0gJChBU01fTUFDUk9fRkxBR1MpDQo+IA0KPiBJJ20gbm90
IHN1cmUgaG93IG11Y2ggd2UgY2FyZSBhYm91dCB0aGlzIG9yIHdoYXQgd2UgY2FuIGRvIGFib3V0
IGl0LCBidXQNCj4gYWRkaW5nIHRoZSBtYWNyb3MucyB0byB0aGUgY29tbWFuZCBsaW5lIGxpa2Ug
dGhpcyBoYXMgZWZmZWN0aXZlbHkgYnJva2VuDQo+IGRpc3RyaWJ1dGVkIGNvbXBpbGluZyB3aXRo
IGRpc3RjYyBhbmQgaWNlY2MgYXMgb2YgdjQuMjAtcmMxLiBOZWl0aGVyDQo+IHRvb2wgd2lsbCBz
dWNjZXNzZnVsbHkgZGlzdHJpYnV0ZSBhbnkgY29tcGlsZSBwcm9jZXNzZXMgYmVjYXVzZSB0aGUN
Cj4gbm9uLWxvY2FsIG1hY2hpbmVzIHdvbid0IGhhdmUgYSBjb3B5IG9mIG1hY3Jvcy5zLg0KDQpF
cnIuLiBJIGRvbuKAmXQgaGF2ZSBhIGRpc3QtY2MgZW52aXJvbm1lbnQuIEkgd29uZGVyIHdoZXRo
ZXIgc29tZXRoaW5nIGxpa2UNCnRoYXQgd291bGQgZG8gdGhlIHRyaWNrOg0KDQotLSA+OCDigJQN
Cg0KU3ViamVjdDogW1BBVENIXSB4ODY6IEZpeCBkaXN0LWNjDQoNCi0tLQ0KIGFyY2gveDg2L01h
a2VmaWxlIHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L01ha2VmaWxlIGIvYXJjaC94ODYvTWFr
ZWZpbGUNCmluZGV4IDViNTYyZTQ2NDAwOS4uODFkNzZjYmNmZmZmIDEwMDY0NA0KLS0tIGEvYXJj
aC94ODYvTWFrZWZpbGUNCisrKyBiL2FyY2gveDg2L01ha2VmaWxlDQpAQCAtMjM3LDkgKzIzNyw5
IEBAIGFyY2hoZWFkZXJzOg0KIAkkKFEpJChNQUtFKSAkKGJ1aWxkKT1hcmNoL3g4Ni9lbnRyeS9z
eXNjYWxscyBhbGwNCiANCiBhcmNobWFjcm9zOg0KLQkkKFEpJChNQUtFKSAkKGJ1aWxkKT1hcmNo
L3g4Ni9rZXJuZWwgYXJjaC94ODYva2VybmVsL21hY3Jvcy5zDQorCSQoUSkkKE1BS0UpICQoYnVp
bGQpPWFyY2gveDg2L2tlcm5lbCAke29ianRyZWV9L2FyY2gveDg2L2tlcm5lbC9tYWNyb3Mucw0K
IA0KLUFTTV9NQUNST19GTEFHUyA9IC1XYSxhcmNoL3g4Ni9rZXJuZWwvbWFjcm9zLnMgLVdhLC0N
CitBU01fTUFDUk9fRkxBR1MgPSAtV2EsJHtvYmp0cmVlfS9hcmNoL3g4Ni9rZXJuZWwvbWFjcm9z
LnMgLVdhLC0NCiBleHBvcnQgQVNNX01BQ1JPX0ZMQUdTDQogS0JVSUxEX0NGTEFHUyArPSAkKEFT
TV9NQUNST19GTEFHUykNCiANCi0tIA0KMi4xNy4xDQoNCg==
