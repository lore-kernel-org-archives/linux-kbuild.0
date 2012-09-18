Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:60991 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753014Ab2IRKjH convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
	Tue, 18 Sep 2012 06:39:07 -0400
Message-Id: <50586B69020000780009C00D@nat28.tlf.novell.com>
Date: Tue, 18 Sep 2012 11:39:05 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: "firmware: fix directory creation rule matching with make
 3.82" break make 3.80
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, mark.asselstine@windriver.com
Cc: linux-kbuild@vger.kernel.org

Michal, Mark,

despite the contrary claim in the description, commit
6c7080a61fc7b46b3ac8573952b5a3e9d5f68bc4 breaks
"make modules_install" with make 3.80 ("No rule to make target
`$(dir)', needed by ..."). Please revert or fix properly.

Jan

