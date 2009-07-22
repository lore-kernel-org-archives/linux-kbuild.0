Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:38825 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754145AbZGVM1b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2009 08:27:31 -0400
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com ([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1MTaux-0007Zh-DR
	for linux-kbuild@vger.kernel.org; Wed, 22 Jul 2009 08:27:31 -0400
Date: Wed, 22 Jul 2009 08:25:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: "header-y" versus "unifdef-y"?
Message-ID: <alpine.LFD.2.00.0907220823370.19368@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  is it my imagination, or did someone recently propose that there
will soon be no distinction between those two Kbuild directives since
it's just as easy to "unifdef" all of them, no matter what?  has that
patch already been submitted for the next major release?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================
