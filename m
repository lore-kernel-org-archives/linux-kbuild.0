Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:48207 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932168Ab2HISys (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 14:54:48 -0400
Message-ID: <50240770.6070207@gmail.com>
Date: Thu, 09 Aug 2012 14:54:40 -0400
From: Salar Ali Mumtaz <salaarali@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] xconfig: Display dependency values in debug_info
References: <1343256982-11421-1-git-send-email-salaarali@gmail.com> <50107EB7.8000009@xenotime.net> <CA+jpPM=nrbpDJpaka6xAp4dbEOQjJrtwQWtUXwi_gGS9b4yK-A@mail.gmail.com> <50117812.5080302@xenotime.net> <50213D69.3060904@gmail.com> <5021486B.6020907@xenotime.net>
In-Reply-To: <5021486B.6020907@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12-08-07 12:55 PM, Randy Dunlap wrote:

> In Kconfig language, is "" the same as 'n' ?
> If so, I'm OK with your proposal above.
> 


So a colleague of mine tested this and came up with a conclusion that expressions in Kconfig can only deal with boolean or tristate operands and no casting is made with strings. Using any string operand as part of a boolean expression is simply a type error and Kconfig probably marks such operand as 'n', regardless of its value.

