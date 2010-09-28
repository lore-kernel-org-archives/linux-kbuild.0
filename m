Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:45675 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717Ab0I1EA2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Sep 2010 00:00:28 -0400
Message-ID: <4CA1685B.1000601@codeaurora.org>
Date: Mon, 27 Sep 2010 21:00:27 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Translating a .S to a .c and back fails
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

 I've recently posted a patch to translate ARM's delay.S in arch/arm/lib
into a C file[1]. This works fine and I can build the tree with the .S
file and then build the tree with the .C file. After I do that I can't
switch back to the .S version of the tree without first removing the
.delay.o.cmd file in my build output directory. It seems that the build
system can't recognize when a C file turns into an assembly file.

Anyone else seen this problem? I admit it is pretty rare, but it becomes
annoying with things like automated building, bisecting, etc. where I
don't make clean all the time.

[1] http://lkml.org/lkml/2010/9/27/605

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

