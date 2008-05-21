Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pmx1.sophos.com ([213.31.172.16]:47008 "EHLO pmx1.sophos.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758203AbYEUPG2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 11:06:28 -0400
Subject: kbuild variable $(src) broken in 2.6.23-rc3?
MIME-Version: 1.0
From: tvrtko.ursulin@sophos.com
Date: Wed, 21 May 2008 15:42:03 +0100
Content-Type: text/plain; charset="US-ASCII"
Message-Id: <20080521144211.902CD37652C@pmx1.sophos.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org

Hi Sam, all

What are the chances $(src) variable might be broken in 2.6.26-rc3? With 
an external module I am seeing it getting expanded to "" (null string) 
while the same pretty straightforward Makefile works fine with 2.6.25.

Thanks,

Tvrtko


Sophos Plc, The Pentagon, Abingdon Science Park, Abingdon,
OX14 3YP, United Kingdom.

Company Reg No 2096520. VAT Reg No GB 348 3873 20.

