Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39881
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753708AbZGVSZs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2009 14:25:48 -0400
Date: Wed, 22 Jul 2009 11:25:54 -0700 (PDT)
Message-Id: <20090722.112554.221617981.davem@davemloft.net>
Subject: Re: [PATCH,resend] sparc64: build compressed image (zImage) by
 default
From: David Miller <davem@davemloft.net>
In-Reply-To: <200907221907.40698.elendil@planet.nl>
References: <200907162041.53181.elendil@planet.nl>
	<20090716201601.GA6038@merkur.ravnborg.org>
	<200907221907.40698.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: elendil@planet.nl
Cc: sparclinux@vger.kernel.org, linux-kbuild@vger.kernel.org, jurij@wooyd.org

From: Frans Pop <elendil@planet.nl>
Date: Wed, 22 Jul 2009 19:07:39 +0200

> I vaguely recall from Debian work that loading compressed kernels caused 
> problems on sparc32 hardware (due to insufficient memory?), which could 
> justify the difference. But I may be wrong.

This is, unfortunately, very likely true.
