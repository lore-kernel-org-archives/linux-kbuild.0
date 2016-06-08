Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:37205 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932342AbcFHX3Y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2016 19:29:24 -0400
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
Date: Wed, 8 Jun 2016 23:29:22 +0000
Message-ID: <1465428562.3885.75.camel@intel.com>
References: <1465263518.3885.9.camel@intel.com> <5756960E.5020706@suse.com>
	 <57569ACC.8050503@suse.cz>
	 <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
	 <5756A675.3080003@suse.cz>
	 <CAK7LNAS4228scb3Ep1MT_FZhHS_+ckJCJZSDT-TN9hcvJ7Wq0A@mail.gmail.com>
	 <1465308627.3885.61.camel@intel.com> <20160607215237.GA13237@sepie.suse.cz>
In-Reply-To: <20160607215237.GA13237@sepie.suse.cz>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C853319373FC6E4E84670451400DBEDE@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "mmarek@suse.com" <mmarek@suse.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

RW0gVGVyLCAyMDE2LTA2LTA3IMOgcyAyMzo1MiArMDIwMCwgTWljaGFsIE1hcmVrIGVzY3JldmV1
Og0KPiBPbiBUdWUsIEp1biAwNywgMjAxNiBhdCAwMjoxMDoyOFBNICswMDAwLCBaYW5vbmksIFBh
dWxvIFIgd3JvdGU6DQo+ID7CoA0KPiANCj4gRnJvbSBiMzZmYWQ2NWQ2MWZmZmU0YjY2MmQ0YmZi
MWVkNjczYzQ1NWEzNmEyIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiBGcm9tOiBNaWNo
YWwgTWFyZWsgPG1tYXJla0BzdXNlLmNvbT4NCj4gRGF0ZTogVHVlLCA3IEp1biAyMDE2IDExOjU3
OjAyICswMjAwDQo+IFN1YmplY3Q6IFtQQVRDSF0ga2J1aWxkOiBJbml0aWFsaXplIGV4cG9ydGVk
IHZhcmlhYmxlcw0KPiANCj4gVGhlIE5PU1RESU5DX0ZMQUdTIHZhcmlhYmxlIGlzIGV4cG9ydGVk
LCBzbyBpdCBuZWVkcyB0byBiZSBjbGVhcmVkIHRvDQo+IGF2b2lkIGR1cGxpY2F0aW5nIGl0cyBj
b250ZW50IHdoZW4gcnVubmluZyBtYWtlIGZyb20gd2l0aGluIG1ha2UNCj4gKGUuZy4NCj4gaW4g
dGhlIHBhY2thZ2luZyB0YXJnZXRzKS4gVGhpcyBiZWNhbWUgYW4gaXNzdWUgYWZ0ZXIgY29tbWl0
DQo+IDljOGZhOWJjMDhmNiAoImtidWlsZDogZml4IGlmX2NoYW5nZSBhbmQgZnJpZW5kcyB0byBj
b25zaWRlciBhcmd1bWVudA0KPiBvcmRlciIpLCB3aGljaCBubyBsb25nZXIgaWdub3JlcyB0aGUg
ZHVwbGljYXRlIG9wdGlvbnMuIEFzIFBhdWxvDQo+IFphbm9uaQ0KPiBwb2ludHMgb3V0LCB0aGUg
TERGTEFHU192bWxpbnV4IHZhcmlhYmxlIGhhcyB0aGUgc2FtZSBwcm9ibGVtLg0KPiANCj4gUmVw
b3J0ZWQtYnk6ICJaYW5vbmksIFBhdWxvIFIiIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+DQo+
IEZpeGVzOiA5YzhmYTliYzA4ZjYgKCJrYnVpbGQ6IGZpeCBpZl9jaGFuZ2UgYW5kIGZyaWVuZHMg
dG8gY29uc2lkZXINCj4gYXJndW1lbnQgb3JkZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
TWFyZWsgPG1tYXJla0BzdXNlLmNvbT4NCg0KV29ya3MgZm9yIG1lLg0KDQpUZXN0ZWQtYnk6IFBh
dWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KDQpUaGFua3MgYSBsb3QhDQoN
Cj4gLS0tDQo+IMKgTWFrZWZpbGUgfCAyICsrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUNCj4gaW5kZXgg
MGY3MGRlNjNjZmRiLi5hZjBjNDYzZTkwOGYgMTAwNjQ0DQo+IC0tLSBhL01ha2VmaWxlDQo+ICsr
KyBiL01ha2VmaWxlDQo+IEBAIC0zNjMsMTEgKzM2MywxMyBAQCBDSEVDSwkJPSBzcGFyc2UNCj4g
wqANCj4gwqBDSEVDS0ZMQUdTwqDCoMKgwqDCoDo9IC1EX19saW51eF9fIC1EbGludXggLURfX1NU
RENfXyAtRHVuaXggLURfX3VuaXhfXyBcDQo+IMKgCQnCoMKgLVdiaXR3aXNlIC1Xbm8tcmV0dXJu
LXZvaWQgJChDRikNCj4gK05PU1RESU5DX0ZMQUdTwqDCoD0NCj4gwqBDRkxBR1NfTU9EVUxFwqDC
oMKgPQ0KPiDCoEFGTEFHU19NT0RVTEXCoMKgwqA9DQo+IMKgTERGTEFHU19NT0RVTEXCoMKgPQ0K
PiDCoENGTEFHU19LRVJORUwJPQ0KPiDCoEFGTEFHU19LRVJORUwJPQ0KPiArTERGTEFHU192bWxp
bnV4ID0NCj4gwqBDRkxBR1NfR0NPVgk9IC1mcHJvZmlsZS1hcmNzIC1mdGVzdC1jb3ZlcmFnZSAt
Zm5vLXRyZWUtbG9vcC0NCj4gaW0gLVduby1tYXliZS11bmluaXRpYWxpemVkDQo+IMKgQ0ZMQUdT
X0tDT1YJPSAtZnNhbml0aXplLWNvdmVyYWdlPXRyYWNlLXBjDQo+IMKg
