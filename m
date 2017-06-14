Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:59508 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752124AbdFNNLL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 09:11:11 -0400
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] Unexport LANG env variable
Date: Wed, 14 Jun 2017 13:11:07 +0000
Message-ID: <1497445867.6424.36.camel@synopsys.com>
References: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
         <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
In-Reply-To: <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FCC27F6141A854399871360E92DD51D@internal.synopsys.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "mmarek@suse.com" <mmarek@suse.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>

SGkgTWljaGFsLA0KDQpPbiBXZWQsIDIwMTctMDYtMTQgYXQgMTU6MDIgKzAyMDAsIE1pY2hhbCBN
YXJlayB3cm90ZToNCj4gRG5lIDE0LjYuMjAxNyB2IDE0OjQwIEFsZXhleSBCcm9ka2luIG5hcHNh
bChhKToNCj4gPiANCj4gPiBJbiB0aG9zZSBjYXNlcyB3aGVuIHdlIHBhcnNlIG91dHB1dCBvZiBz
dGFuZGFyZCB1dGlsaXRpZXMgbGlrZSByZWFkZWxmDQo+ID4gZXRjIHdlIHJlbHkgb24gYSBwYXJ0
aWN1bGFyIHNlbnRlbmNlcy4gRm9yIGV4YW1wbGUgZm9yIEFSQyB3ZSBleHRyYWN0DQo+ID4gYW4g
ZW50cnktcG9pbnQgZnJvbSB2bWxpbnV4IGxpa2UgdGhhdDoNCj4gPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IHJlYWRlbGYgLWggdm1saW51eCB8IGdy
ZXAgIkVudHJ5IHBvaW50IGFkZHJlc3MiIHwgZ3JlcCAtbyAweC4qDQo+ID4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiBBbmQgaW4gY2FzZSBM
QU5HIGlzIHNldCB0byBhbnl0aGluZyBvdGhlciB0aGFuIGVuX1hYIHdlJ3JlIGdldHRpbmcNCj4g
PiBub3RoaW5nIGFuZCBzdWJzZXF1ZW50IGV4ZWN1dGlvbiBvZiBta2ltYWdlIHV0aWxpdHkgZmFp
bHMuDQo+ID4gDQo+ID4gUHJvYmFibHkgdGhlcmUncmUgbW9yZSBjYXNlcyBsaWtlIHRoYXQgYnV0
IGdpdmVuIHBlb3BsZSByYXJlbHkNCj4gPiB1c2Ugbm9uLUVuZ2xpc2ggbG9jYWxlcyBvbiB0aGVp
ciBkZXYgbWFjaGluZXMgcHJvYmxlbXMgbGlrZSB0aGUgb25lDQo+ID4gYWJvdmUgYXJlIG5vdCB2
ZXJ5IHZpc2libGUuDQo+IA0KPiBJJ20gYWxsIGZvciB0aGlzIGNoYW5nZSBidXQgdGhlICoucG8g
ZmlsZXMgaW4gdGhlIGdjYyB0cmVlIG11c3QgaGF2ZQ0KPiBiZWVuIGNyZWF0ZWQgZm9yIGEgcmVh
c29uOg0KPiANCj4gwqAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91
PWh0dHBzLTNBX19naXRodWIuY29tX2djYy0yRG1pcnJvcl9nY2NfdHJlZV9tYXN0ZXJfZ2NjX3Bv
JmQ9RHdJQ0JBJmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPWxxZGVlU1NFZXMNCj4gMEdGRERs
NjU2ZVZpWE83YnJlUzU1eXRXa2hwazVSODFJJm09djJpbFlZdjZaMFd6VmFJeXMzc0NRZEszUUJJ
OWdxSDdoVW1vVEdQcEo0NCZzPVMzQjc5U0hvdnR0MS13TFJ0bmdUVU0wZEtXTWlva0dFNzVISXJm
Z2tiYmMmZT3CoA0KDQpUaGF0J3MgZm9yIHN1cmUuDQoNCkJ1dCB0aGVuIGhvdyBtYXkgd2UgaGF2
ZSBhIHByZWRpY3RhYmxlIGVudmlyb25tZW50IGZvciBvdXIgbWFjaGluZXJ5Pw0KDQpJIGRvIHJl
YWxpemUgdGhhdCB3aXRoIHRoYXQgY2hhbmdlIGluIHBsYWNlIHBlb3BsZSB3aWxsIHN0YXJ0IHNl
ZWluZw0Kbm9uLXRyYW5zbGF0ZWQgbWVzc2FnZXMgZnJvbSBvdGhlciB0b29scyBsaWtlIGNvbXBp
bGVyIGV0Yy4NCg0KQnV0IHByb2JhYmx5IHRoYXQncyBub3QgdGhlIHdvcnN0IGlkZWEgYXMgd2Vs
bCBiZWNhdXNlIGl0IGhlbHBzIGdvb2dsaW5nIDopDQoNCi1BbGV4ZXk=
