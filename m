Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:10644 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbgCZSv0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 14:51:26 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v3 1/8] lib: prepare zstd for preboot environment
Date: Thu, 26 Mar 2020 18:50:43 +0000
Message-ID: <40FFD6B5-8353-4126-9F89-B8F21A400EB3@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-2-nickrterrell@gmail.com>
 <20200326154038.GA21231@ntb.petris.klfree.czf>
In-Reply-To: <20200326154038.GA21231@ntb.petris.klfree.czf>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7C6279926EAF149A94698AD0AFBD329@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Malat <oss@malat.biz>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>

DQoNCj4gT24gTWFyIDI2LCAyMDIwLCBhdCA4OjQwIEFNLCBQZXRyIE1hbGF0IDxvc3NAbWFsYXQu
Yml6PiB3cm90ZToNCj4gDQo+IEhpIE5pY2ssDQo+IEkgZmluYWxseSBnb3Qgc29tZSB0aW1lIHRv
IHJldmlldyB5b3VyIHBhdGNoLCBoZXJlIGFyZSBteSBjb21tZW50czoNCj4gDQo+IE9uIFdlZCwg
TWFyIDI1LCAyMDIwIGF0IDEyOjU4OjQyUE0gLTA3MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+
ICogRG9uJ3QgZXhwb3J0IHN5bWJvbHMgaWYgWlNURF9QUkVCT09UIGlzIGRlZmluZWQuDQo+IEkn
bSBub3Qgc3VyZSBpZiB0aGlzIGlzIG5lZWRlZC4gV2hlbiBJIHdvcmtlZCBvbiBteSBwYXRjaCwg
SSBoYXZlIGZvdW5kIHRoYXQNCj4gYWxsIGV4cG9ydGluZyBhbmQgbW9kaW5mbyBtYWNyb3MgZ2Vu
ZXJhdGUgc3ltYm9scyBpbiBtb2RpbmZvIGFuZCBkaXNjYXJkLmtzeW0NCj4gc2VjdGlvbnMsIHdo
aWNoIGFyZSB0aGVuIGRyb3BwZWQgYnkgdGhlIHZtbGludXggbGlua2VyIHNjcmlwdCwgdGh1cyBv
bmUNCj4gd2lsbCBnZXQgdGhlIHNhbWUgYmluYXJ5IGluZGVwZW5kZW50bHkgaWYgaGUgcHV0cyB0
aGlzIGNoYW5nZSBpbiBvciBub3QuDQo+IA0KPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBpbnRl
bnRpb25hbCBhcyB0aGVyZSBpcyBhbHNvIF9fRElTQUJMRV9FWFBPUlRTIGRlZmluZSwNCj4gd2hp
Y2ggc2hvdWxkIGJlIHVzZWQgYnkgYSBkZWNvbXByZXNzb3IgKGFjY29yZGluZyB0byBjb21tZW50
cyBpbiBleHBvcnQuaCkuDQoNClRoaXMgaXMgbm90IG15IGFyZWEgb2YgZXhwZXJ0aXNlLCBJ4oCZ
bSBhIHpzdGQgZGV2ZWxvcGVyIG5vdCBhIGtlcm5lbCBkZXZlbG9wZXIuDQpGb3IgdGhhdCByZWFz
b24gSSB3YW50ZWQgdG8gcGljayB0aGUgc2FmZSByb3V0ZSBvZiBkaXNhYmxpbmcgdGhlIGV4cG9y
dHMgZXhwbGljaXRseSwNCnNpbmNlIHRoYXQgaXMgd2hhdCB0aGUgb3RoZXIgZGVjb21wcmVzc29y
cyBkbywgc28gSSBrbm93IGl0IHdvcmtzLg0KDQpJZiB5b3XigJlyZSBjb25maWRlbnQgdGhhdCBp
dCBpc27igJl0IG5lY2Vzc2FyeSwgSSBjYW4gZHJvcCB0aGUgbW9kaWZpY2F0aW9uLiBCdXQsIEkg
ZG8NCnByZWZlciB0aGlzIGFwcHJvYWNoLCBiZWNhdXNlIHRoZXJlIGlzIG5vIG1hZ2ljIGludm9s
dmVkLiBJIGNhbiBzZWUgd2hhdCBpcw0KaGFwcGVuaW5nIGNsZWFybHkganVzdCBieSBsb29raW5n
IGF0IHRoZSBkZWNvbXByZXNzX3VuenN0ZC5jIGNvZGUuDQoNClRoYW5rcyBmb3IgdGhlIHJldmll
dywNCk5pY2sNCg0K
