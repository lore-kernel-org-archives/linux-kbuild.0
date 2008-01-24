Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:37601 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758525AbYAXWEb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:31 -0500
Date: Thu, 24 Jan 2008 14:04:22 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: kbuild: Preparing for merge window
Message-Id: <20080124140422.409555b9.randy.dunlap@oracle.com>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 24 Jan 2008 22:58:13 +0100 Sam Ravnborg wrote:

> The following is the list of patches queued up for the merge window at the moment.
> I have during the last week done several modpost changes to make section ismatch
> warnings more reliable and I am happy with the modified modpost code now.


Hi Sam,

Can you add (if not already done) a paragraph to kconfig-language.txt
about the preference of using HAVE_feature in Kconfig files vs.
other spellings of that?

---
~Randy
