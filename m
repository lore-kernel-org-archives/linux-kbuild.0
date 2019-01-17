Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx.socionext.com ([202.248.49.38]:43913 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbfAQF7H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 00:59:07 -0500
From: <yamada.masahiro@socionext.com>
Subject: RE: [PATCH 2/3] kbuild: add real-prereqs shorthand for $(filter-out
 FORCE, $^)
Date: Thu, 17 Jan 2019 05:59:03 +0000
Message-ID: <bf7380ec3fa145958c3f7b3e3551a395@SOC-EX01V.e01.socionext.com>
References: <1547698231-20985-1-git-send-email-yamada.masahiro@socionext.com>
 <1547698231-20985-2-git-send-email-yamada.masahiro@socionext.com>
 <71a0e80a-c587-4973-cfc3-9c74b2b3a16c@ozlabs.ru>
In-Reply-To: <71a0e80a-c587-4973-cfc3-9c74b2b3a16c@ozlabs.ru>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: aik@ozlabs.ru, linux-kbuild@vger.kernel.org
Cc: mark.rutland@arm.com, mgreer@animalcreek.com, linux-kernel@vger.kernel.org, paulus@samba.org, hpa@zytor.com, x86@kernel.org, mingo@redhat.com, joel@jms.id.au, jhogan@kernel.org, devicetree@vger.kernel.org, keescook@chromium.org, npiggin@gmail.com, robh+dt@kernel.org, bp@alien8.de, tglx@linutronix.de, michal.lkml@markovi.net, maurosr@linux.vnet.ibm.com, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linuxppc-dev@lists.ozlabs.org

SGkgQWxleGV5LA0KDQo+IFdoYXQgaXMgdGhpcyBzZXJpZXMgbWFkZSBvbiB0b3Agb2Y/IFRoaXMg
ZG9lcyBub3QgYXBwbHkgb24gdG9wIG9mIG1hc3Rlcg0KPiBmcm9tDQo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LTIuNi5naXQN
Cg0KDQpJZiB5b3Ugd2FudCB0byBhcHBseSB0aGlzIHNlcmllcyBjbGVhbmx5LCBwbGVhc2UgYXBw
bHkgdGhlIGZvbGxvd2luZyBmaXJzdDoNCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC8xMDc2MTYyNS8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA3Njcx
OTMvDQoNCg0KDQpUaGUgY29uZmxpY3RzIGFyZSBub3Qgc2lnbmlmaWNhbnQuDQpZb3UgY2FuIHVz
ZSAnZ2l0IGFtIC1DMScgaWYgeW91IHdhbnQgdG8gYXBwbHkgdGhpcyBzZXJpZXMNCmRpcmVjdGx5
IHRvIExpbnVzIHRyZWUuDQoNCk1hc2FoaXJvDQoNCg==
