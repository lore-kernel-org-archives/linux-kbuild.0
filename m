Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:38017 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751686AbYAWQov (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2008 11:44:51 -0500
Message-Id: <F99D5D66-3364-4414-86D3-7ED68037981C@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v915)
Subject: kbuild question -- make sure at least one config choice is selected?
Date: Wed, 23 Jan 2008 10:44:40 -0600
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org
Cc: linux-kbuild@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Roman,

I know this has come up before, but wasn't sure if any recent  
enhancements to Kconfig have resolved this issue.

We have a set of board choices in PPC land that are 'config' options.   
We want to make sure the user selects at least one of them (or force  
at least one of them to be selected).  Is there a way to do that?

thanks

- k
