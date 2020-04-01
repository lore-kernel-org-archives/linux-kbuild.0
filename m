Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:63010 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727661AbgDATAh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 15:00:37 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Date: Wed, 1 Apr 2020 19:00:04 +0000
Message-ID: <CC22D163-BB96-42F5-88DE-BD203860E7C2@fb.com>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
 <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
 <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
In-Reply-To: <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED8B7B0A0D110C49B3B4C5C4F84AD313@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>

PiBPbiBBcHIgMSwgMjAyMCwgYXQgMjo1MCBBTSwgU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIEFwciAxLCAyMDIwIGF0IDQ6NTIgQU0gTmlj
ayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4+IE9u
IE1hciAzMSwgMjAyMCwgYXQgODoxMSBBTSwgU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWls
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgNjoxNSBBTSBO
aWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gWy4uLl0NCj4+
PiANCj4+Pj4+IERvIHlvdSBwbGFuIHRvIHB1c2ggdGhpcyBmb3IgTGludXggdjUuNz8NCj4+Pj4g
DQo+Pj4+IEkgaG9wZSB0aGF0IGl0IHdpbGwgYmUgYWNjZXB0ZWQuIEZyb20gbXkgcG9pbnQgb2Yg
dmlldyB0aGlzIHBhdGNoIHNldCBpcw0KPj4+PiByZWFkeSBmb3IgbWVyZ2UsIGV4Y2VwdCBmb3Ig
dGhlIG1heGltdW0gd2luZG93IHNpemUgaW5jcmVhc2UNCj4+Pj4gcmVxdWVzdGVkIGJ5IFBldHIu
DQo+Pj4+IA0KPj4+IA0KPj4+IEhpIE5pY2ssDQo+Pj4gDQo+Pj4gdGhhbmtzIGZvciB5b3VyIGFu
c3dlci4NCj4+PiANCj4+PiBEaWQgeW91IHNlbmQgb3V0IGEgcHVsbC1yZXF1ZXN0IGFscmVhZHk/
DQo+PiANCj4+IEkgaGF2ZW7igJl0IHNlbnQgb3V0IGEgcHVsbCByZXF1ZXN0LiBJZiB0aGF0IGlz
IHNvbWV0aGluZyB0aGF0IEkgbmVlZCB0bw0KPj4gZG8sIG9yIGlmIGl0IG1ha2VzIHRoZSBwcm9j
ZXNzIGVhc2llciBmb3IgYSBtYWludGFpbmVyIHRvIG1lcmdlIHRoZW4NCj4+IEkgY2FuIGRvIHRo
YXQuDQo+PiANCj4gDQo+IFsgQ0MgIFN0ZXBoZW4gUm90aHdlbGwgKG1haW50YWluZXIgb2YgTGlu
dXgtbmV4dCkgXQ0KPiANCj4gSGkgTmljaywNCj4gDQo+IGFzIEFkYW0gcG9pbnRlZCBvdXQgaXQg
bWlnaHQgYmUgZ29vZCB0byBhc2sgIlN0ZXBoZW4gUm90aHdlbGwiDQo+IDxzZnJAY2FuYi5hdXVn
Lm9yZy5hdT4NCj4gdG8gaW5jbHVkZSB5b3VyIEdpdCB0cmVlIGludG8gbGludXgtbmV4dC4gU3Rl
cGhlbiB3aWxsIGdpdmUgeW91IHNvbWUNCj4gaW5mb3JtYXRpb25zIGFib3V0IHRoYXQuDQoNClRo
YW5rcyBmb3IgdGhlIHBvaW50ZXJzIFNlZGF0IGFuZCBBZGFtISBJIHdpbGwgcmVhY2ggb3V0IGFu
ZCBhc2sNCmFib3V0IHRoZSBiZXN0IHdheSBmb3J3YXJkLiBJIGRvbuKAmXQgcGFydGljdWxhcmx5
IGNhcmUgaWYgaXQgbWFrZXMgaXQgaW4NCjUuNyBvciA1LjgsIEkganVzdCB3YW50IHRvIGVuc3Vy
ZSB0aGF0IGl0IGRvZXMgZ2V0IG1lcmdlZCB0aGlzIHRpbWUuDQoNCkJlc3QsDQpOaWNrDQoNCg==
