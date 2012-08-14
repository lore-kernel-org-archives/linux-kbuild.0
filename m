Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 209.248.170.90.nw.nuvox.net ([209.248.170.90]:47891 "EHLO
	GVL-MAIL.koe-americas.local" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753342Ab2HNMyn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Aug 2012 08:54:43 -0400
From: David Cullen <David.Cullen@koe-americas.com>
Subject: Re: [PATCH RFC] Fix "/usr/bin/xargs: rm: Argument list too long"
 during make distclean
Date: Tue, 14 Aug 2012 12:54:41 +0000
Message-ID: <502A4A90.3070901@koe-americas.com>
References: <502957D5.1070800@koe-americas.com> <502965BE.3070406@zytor.com>
 <502969FA.6010907@koe-americas.com> <50296B34.8090502@zytor.com>
In-Reply-To: <50296B34.8090502@zytor.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C236C0ACF09F4498F9343BCA50EB71A@koe-americas.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gOC8xMy8yMDEyIDU6MDEgUE0sIEguIFBldGVyIEFudmluIHdyb3RlOg0KPiBPbiAwOC8xMy8y
MDEyIDAxOjU2IFBNLCBEYXZpZCBDdWxsZW4gd3JvdGU6DQo+Pj4NCj4+PiBUaGF0IHNvdW5kcyBs
aWtlIGEgYnVnIGluIHhhcmdzLi4uDQo+Pj4NCj4+DQo+PiBJbiBteSBzcGVjaWZpYyBjYXNlLCBx
ZW11LWFybS1zdGF0aWMgY2FsbHMgeGFyZ3MgKEluIGZhY3QsIGluIG15DQo+PiBjcm9zcyBjaHJv
b3QsIHFlbXUtYXJtLXN0YXRpYyBpcyB1c2VkIHRvIHJ1biBldmVyeSB1c2VyIG1vZGUgcHJvY2Vz
cykuDQo+Pg0KPj4gRG8geW91IG1lYW4gdGhhdCBxZW11LWFybS1zdGF0aWMgaXMgZXhwb3Npbmcg
YSBsYXRlbnQgZGVmZWN0IGluIHhhcmdzPw0KPj4NCj4+IERvZXMgcWVtdS1hcm0tc3RhdGljIHN0
ZWFsIHNvbWUgb2YgdGhlIGNvbW1hbmQgbGluZSBzcGFjZSB0aGF0IHdvdWxkDQo+PiBub3JtYWxs
eSBiZSBhdmFpbGFibGUgZm9yIHhhcmdzPyBJZiBzbywgaG93IHdvdWxkIHhhcmdzIGZpZ3VyZSBv
dXQNCj4+IHRoaXMgd2FzIGhhcHBlbmluZyBhbmQgaGFuZGxlIHRoZSBwcm9ibGVtPw0KPj4NCj4g
DQo+IEkgaGF2ZSBubyBpZGVhLiAgUGVyaGFwcyBzdHJhY2UgY2FuIGhlbHAgeW91IHNlZSB3aGF0
IGlzIGhhcHBlbmluZywgSQ0KPiBkb24ndCBrbm93LiAgTW9yZSBsaWtlbHkgaXQgaXMgcWVtdS1h
cm0tc3RhdGljIHRoYXQgaXMgYnJva2VuIGFuZCBpdCBpcw0KPiB0cnlpbmcgdG8gZW5mb3JjZSB0
aGUgb2xkIDEyOEsgbGltaXQgdGhhdCB3ZSB1c2VkIHRvIGhhdmUgYmVmb3JlIDIuNi4yMy4NCj4g
IFRoaXMgY291bGQgY2F1c2UgYSBtaXNtYXRjaCBiZXR3ZWVuIHdoYXQgc3lzY29uZihfU0NfQVJH
X01BWCkgcmV0dXJucw0KPiBhbmQgd2hhdCB0aGUgYWN0dWFsIGxpbWl0IGlzLg0KPiANCj4gQW55
d2F5LCBldmVuIG1vcmUgc28gdGhlIHJlYXNvbiB0byByZWplY3QgdGhpcyBwYXRjaC4NCg0KDQpJ
IHN1Ym1pdHRlZCBhIGJ1ZyByZXBvcnQgb24geGFyZ3M6DQoNCiAgICBodHRwOi8vc2F2YW5uYWgu
Z251Lm9yZy9idWdzL2luZGV4LnBocD8zNzA5Mw0KDQpJIGFsc28gc3VibWl0dGVkIGEgYnVnIHJl
cG9ydCBvbiBRRU1VOg0KDQogICAgaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvcWVtdS8rYnVn
LzEwMzY2NDUNCg==
