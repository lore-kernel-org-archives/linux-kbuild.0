Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta7.telus.net ([209.171.16.80]:56625 "EHLO cmta7.telus.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753392AbbINDRF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Sep 2015 23:17:05 -0400
From: "Doug Smythies" <dsmythies@telus.net>
Subject: Re: [PATCH v5] deb-pkg: add source package
Date: Sun, 13 Sep 2015 20:08:48 -0700
Message-ID: <000701d0ee9a$ae397600$0aac6200$@net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Riku Voipio' <riku.voipio@linaro.org>, 'Michal Marek' <mmarek@suse.com>
Cc: 'maximilian attems' <maks@stro.at>, 'Ben Hutchings' <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 'Doug Smythies' <dsmythies@telus.net>, 'Chris J Arges' <chris.j.arges@canonical.com>

Kernel 4.3-rc1 introduces 
Commit 3716001bcb7f5822382ac1f2f54226b87312cc6b 
which was from an e-mail thread of this subject name.
I am not on the linux-kbuild e-mail list, but have
found and reviewed the approximately 45 e-mails
of this thread, back to v1.

I understand that I now need to use bindeb-pkg
where I used to use deb-pkg to compile the kernel.

However, I do not understand why I now get a .change
file that I do not want.

Nor do I want the 532 lines of "dpkg-genchanges"
and ""Use of uninitialized value" warnings at the end
of the compile.
 
I am asking why is this stuff here (in
scripts/package/builddeb):

>+EOF
>+	mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
>+	tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{copyright,rules,changelog,control}
>+	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
>+		-b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
>+	mv ${sourcename}_${packageversion}*dsc ..
>+	dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
>+else
>+	dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.changes
>+fi
>+

and suggest that (at least for people that just want things
to be the way they were) it should be:

+EOF
+	mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
+	tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{copyright,rules,changelog,control}
+	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
+		-b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
+	mv ${sourcename}_${packageversion}*dsc ..
+	dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
+fi


