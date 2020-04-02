Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:13772 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389523AbgDBU0S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 16:26:18 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Date: Thu, 2 Apr 2020 20:25:49 +0000
Message-ID: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com> <20200402155810.GD9352@zn.tnic>
In-Reply-To: <20200402155810.GD9352@zn.tnic>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEB30BF64D2AC240AB499C2CF5EFE247@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

DQoNCj4gT24gQXByIDIsIDIwMjAsIGF0IDg6NTggQU0sIEJvcmlzbGF2IFBldGtvdiA8YnBAYWxp
ZW44LmRlPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgQXByIDAxLCAyMDIwIGF0IDA1OjMzOjAzUE0g
KzAwMDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+IFRoZSBjb2RlIGlzIGN1cnJlbnRseSB3cml0
dGVuIHNvIHRoYXQgYWxsIHRoZSBjb21wcmVzc2lvbiBhbGdvcml0aG1zIHVzZSB0aGUNCj4+IHNh
bWUgWk9fel9leHRyYV9ieXRlcy4gSXQgaXMgdGFrZW4gdG8gYmUgdGhlIG1heGltdW0gb2YgdGhl
IGdyb3d0aCByYXRlDQo+PiBwbHVzIHRoZSBtYXhpbXVtIGZpeGVkIG92ZXJoZWFkLiBKdXN0IGEg
ZmV3IGxpbmVzIGFib3ZlIGlzIHRoZSBjb21tZW50Og0KPj4gDQo+PiAjIOKApiBIZW5jZSBzYWZl
dHkNCj4+ICMgbWFyZ2luIHNob3VsZCBiZSB1cGRhdGVkIHRvIGNvdmVyIGFsbCBkZWNvbXByZXNz
b3JzIHNvIHRoYXQgd2UgZG9uJ3QNCj4+ICMgbmVlZCB0byBkZWFsIHdpdGggZWFjaCBvZiB0aGVt
IHNlcGFyYXRlbHkuIFBsZWFzZSBjaGVjaw0KPj4gIyB0aGUgZGVzY3JpcHRpb24gaW4gbGliL2Rl
Y29tcHJlc3Nvcl94eHguYyBmb3Igc3BlY2lmaWMgaW5mb3JtYXRpb24uDQo+PiANCj4+IFNvIEkg
d2FzIGJlZW4gZm9sbG93aW5nIHRoZSBndWlkYW5jZSBpbiB0aGUgY29tbWVudHMuDQo+IA0KPiBQ
bGVhc2Ugc3RhdGUgdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hlbiB5b3Ugc2VuZCB5b3Vy
IG5leHQNCj4gcmV2aXNpb24uDQoNCldpbGwgZG8uDQoNCj4+IERvZXMgaXQgbWF0dGVyPyBJ4oCZ
bSBub3QgYW4gZXhwZXJ0IGhlcmUsDQo+IA0KPiBIdWgsIHlvdSdyZSBvbmx5IHNlbmRpbmcgdGhl
IGNvZGUgdGhlbj8gT3Igd2hhdCBkbyB5b3UgbWVhbiB3aXRoIG5vdA0KPiBiZWluZyBhbiBleHBl
cnQ/DQoNCkkgbWVhbiB0aGF0IHdoaWxlIEnigJl2ZSByZWFkIGFuZCB1bmRlcnN0b29kIHRoaXMg
cGllY2Ugb2YgdGhlIGNvZGUsIGhhdmUgdGVzdGVkDQp0aGUgcGF0Y2hlcywgaGF2ZSBmb2xsb3dl
ZCB0aGUgdGVtcGxhdGUgb2Ygb3RoZXIgY29tcHJlc3Npb24gbWV0aG9kcw0KYWRkZWQsIGFuZCBh
bSBjb25maWRlbnQgaW4gdGhlIGNvcnJlY3RuZXNzIG9mIHRoZSBjb2RlLCBJ4oCZbSBub3QgYSBy
ZWd1bGFyDQpjb250cmlidXRvciB0byB0aGUgcHJlLWJvb3QgeDg2IGtlcm5lbCBjb2RlLiBTbyBp
dCBpcyBwb3NzaWJsZSB0aGF0IHRoZXJlIGlzIGENCnVzZSBjYXNlIGZvciBrZXJuZWwgY29tcHJl
c3Npb24gdGhhdCBJ4oCZbSBub3QgYXdhcmUgb2Ygd2hlcmUgUkFNIGlzIGV4dHJlbWVseQ0KdGln
aHQgYW5kIHdpdGhpbiA2NCBLQiBvZiB0aGUgY3VycmVudCBsaW1pdHMuDQoNCkl0IHNlZW1zIHRv
IG1lIHRoYXQgYWRkaW5nIDY0S0IgdG8gdGhlIG1lbW9yeSByZXF1aXJlbWVudCBmb3Iga2VybmVs
DQpkZWNvbXByZXNzaW9uIGlzIG5vdCBnb2luZyB0byBicmVhayBhbnlvbmUuIElmIGl0IGRpZCB0
aGUga2VybmVsIGltYWdlIGlzIHRha2luZw0KdXAgbmVhcmx5IGFsbCBhdmFpbGFibGUgUkFNLCB3
aGljaCBkb2VzbuKAmXQgc2VlbSBsaWtlbHkuIEJ1dCwgSSBkb27igJl0IGtub3cgYWxsDQp1c2Ug
Y2FzZXMuIElmIGl0IGRvZXMgYnJlYWsgc29tZW9uZSwgd2UgY2FuIHB1dCB1cCBhIHNlcGFyYXRl
IHBhdGNoIHRoYXQNCnN3aXRjaGVzIGFsbCB0aGUgY29tcHJlc3Npb24gbWV0aG9kcyBvdmVyIGEg
cGVyLW1ldGhvZCBaT196X2V4dHJhX2J5dGVzLg0KDQpCZXN0LA0KTmljaw0KDQo=
