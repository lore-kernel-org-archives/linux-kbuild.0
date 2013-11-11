Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:43197 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754205Ab3KKSHd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Nov 2013 13:07:33 -0500
Message-ID: <52811DDD.3030609@linux.intel.com>
Date: Mon, 11 Nov 2013 10:11:41 -0800
From: David Cohen <david.a.cohen@linux.intel.com>
MIME-Version: 1.0
Subject: make oldnoconfig fix?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, mmarek@suse.cz, yann.morin.1998@free.fr, rostedt@goodmis.org

Hi,

Is there a plan to fix 'make oldnoconfig' option?
I currently have need to it :)
I've tracked a thread fixing 'make olddefconfig' where 'oldnoconfig'
option is reported as a known bug, right?

Br, David Cohen
