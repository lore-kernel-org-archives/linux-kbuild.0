Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:49936 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726260AbgCZV7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:59:14 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Date: Thu, 26 Mar 2020 21:58:59 +0000
Message-ID: <48A06739-A73B-4AE3-80A2-3F490B78404B@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
 <20200326201634.GA9948@ntb.petris.klfree.czf>
 <ED5FFEDC-A3B7-470E-95AE-B60EB1E6AE64@fb.com>
 <20200326214419.GA13249@ntb.petris.klfree.czf>
In-Reply-To: <20200326214419.GA13249@ntb.petris.klfree.czf>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <062C362D7CFD85429D95828EDC6128A8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Malat <oss@malat.biz>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>

DQoNCj4gT24gTWFyIDI2LCAyMDIwLCBhdCAyOjQ0IFBNLCBQZXRyIE1hbGF0IDxvc3NAbWFsYXQu
Yml6PiB3cm90ZToNCj4gDQo+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA5OjEzOjU0UE0gKzAw
MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4gV2hhdCBkbyB5b3UgbWVhbiBieSB0aGF0PyBD
YW4geW91IHNoYXJlIHdpdGggbWUgdGhlIHRlc3QgeW91IHJhbj8NCj4+Pj4gSXMgdGhpcyBmb3Ig
a2VybmVsIGRlY29tcHJlc3Npb24gb3IgaW5pdHJhbWZzIGRlY29tcHJlc3Npb24/DQo+Pj4gSW5p
dHJhbWZzIC0geW91IGNhbiBhcHBseSBteSB2MiBwYXRjaCBvbiB2NS41IGFuZCB0cnkgd2l0aCB5
b3VyIHRlc3QgZGF0YS4NCj4+PiANCj4+PiBJIGhhdmUgdGVzdGVkIHlvdXIgcGF0Y2ggYWxzbyBv
biBBUk12NyBwbGF0Zm9ybSBhbmQgdGhlcmUgdGhlIGRlZ3JhZGF0aW9uDQo+Pj4gd2FzIDglLg0K
Pj4gDQo+PiBBcmUgeW91IGNvbXBhcmluZyB0aGUgcGVyZm9ybWFuY2Ugb2YgYW4gOCBNQiB3aW5k
b3cgc2l6ZSB2cyBhIDEyOCBNQg0KPj4gd2luZG93IHNpemU/DQo+IE5vLCBJIHVzZSB0aGUgc2Ft
ZSBpbml0cmFtZnMgZmlsZSB3aXRoIDIgZGlmZmVyZW50IGtlcm5lbHMgZm9yIHRoZSB0ZXN0LiBJ
IGhhdmUNCj4gcmVtb3ZlZA0KPiAgaWYgKHBhcmFtcy53aW5kb3dTaXplID4gWlNURF9XSU5ET1dT
SVpFX01BWCkgZ290byBvdXQ7DQo+IGZyb20geW91ciBjb2RlLg0KDQpUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9uLiBJIHdpbGwgdHJ5IHRvIHJlcHJvZHVjZSB0aGUgc3BlZWQgZGlmZmVyZW5j
ZSB5b3XigJl2ZQ0KbWVhc3VyZWQgYmVmb3JlIHN1Ym1pdHRpbmcgdjQgKHRoYXQgZGVsZXRlcyB0
aGUgd2luZG93U2l6ZSBib3VuZCkuDQoNCkluaXRyYW1mcyBwYXNzZXMgdGhlIHdob2xlIGlucHV0
IGJ1ZmZlciAoZG9lc27igJl0IHVzZSBmaWxsKSwgYnV0IGRvZXMgdXNlIGZsdXNoLg0KWnN0ZCBh
bHdheXMgZGVjb21wcmVzc2VzIGludG8gYW4gaW50ZXJuYWwgYnVmZmVyLCB0aGVuIGNvcGllcyBp
bnRvIHRoZQ0KWlNURF9vdXRCdWZmZXIuIFRoYXQgbWVhbnMgdGhlIG9ubHkgZnVuY3Rpb25hbCBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3bw0KdmVyc2lvbnMgZm9yIGluaXRyYW1mcyBzaG91bGQg
YmUgdGhhdCBJIHdpbGwgY2FsbCBmbHVzaCgpIDQgS0IgYXQgYSB0aW1lLCBhbmQgeW91DQpjYWxs
IGZsdXNoIDEyOCBLQiBhdCBhIHRpbWUuIE5haXZlbHkgSSB3b3VsZG7igJl0IGV4cGVjdCB0aGlz
IHRvIG1hdHRlciB0b28gbXVjaCwNCmJ1dCBJIHdpbGwgbWVhc3VyZS4NCg0KQmVzdCwNCk5pY2s=
