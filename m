Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtagate3.uk.ibm.com ([194.196.100.163]:41216 "EHLO
	mtagate3.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752914Ab0K2LRT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Nov 2010 06:17:19 -0500
Message-ID: <4CF38BBA.4020202@de.ibm.com>
Date: Mon, 29 Nov 2010 12:17:14 +0100
From: Christian Borntraeger <borntraeger@de.ibm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Built kernel without -O2 option
References: <AANLkTimewZ4QhxzL2vOYYV85pegy8Fu6Rb4XUAPqGUXS@mail.gmail.com> <20101129081619.GD5218@cr0.nay.redhat.com>    <4CF37603.5080301@de.ibm.com> <52488.94.211.195.167.1291029121.squirrel@gate.crashing.org>
In-Reply-To: <52488.94.211.195.167.1291029121.squirrel@gate.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Hui Zhu <teawater@gmail.com>, linux-kernel@vger.kernel.org, gdb@sourceware.org, hellogcc@freelists.org, linux-kbuild@vger.kernel.org

Am 29.11.2010 12:12, schrieb Segher Boessenkool:
>> In essence -O2 just tells gcc to activate a list of optimizations
>> gcc  -Q -O2 --help=optimizers
>> tells you what.
> 
> Not quite; see http://gcc.gnu.org/wiki/FAQ#optimization-options .
> 

Erm...right. Thank you.
