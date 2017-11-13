Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:40182 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753738AbdKMNf6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 08:35:58 -0500
From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: tools/iio: build race condition
Date: Mon, 13 Nov 2017 14:28:23 +0100
Message-ID: <1677426.KFAAP6tCV8@ws-stein>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

I tried to compile the new v4.14 kernel and hit a race condition in the build system of tools/iio.
Here is my output (sorry for German strings, I wasn't able to reproduce with LANG=C):
> {master linux} % make O=build_x86/ -j9 tools/iio
> make[1]: Verzeichnis „/home/alex/Dokumente/repo/linux/build_x86“ wird betreten
>   DESCEND  iio
> mkdir -p /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio 2>&1 || true
> ln -sf /home/alex/Dokumente/repo/linux/tools/iio/../../include/uapi/linux/iio/events.h /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio
> ln -sf /home/alex/Dokumente/repo/linux/tools/iio/../../include/uapi/linux/iio/types.h /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_generic_buffer.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor-in.o
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio-in.o
> /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o: file not recognized: File truncated
> make[4]: *** [/home/alex/Dokumente/repo/linux/tools/build/Makefile.build:145: /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor-in.o] Fehler 1
> /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o: file not recognized: File truncated
> make[3]: *** [Makefile:45: /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor-in.o] Fehler 2
> make[3]: *** Es wird auf noch nicht beendete Prozesse gewartet....
> make[4]: *** [/home/alex/Dokumente/repo/linux/tools/build/Makefile.build:145: /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio-in.o] Fehler 1
> make[3]: *** [Makefile:39: /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio-in.o] Fehler 2
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_generic_buffer-in.o
> make[2]: *** [Makefile:62: iio] Fehler 2
> make[1]: *** [/home/alex/Dokumente/repo/linux/Makefile:1628: tools/iio] Fehler 2
> make[1]: Verzeichnis „/home/alex/Dokumente/repo/linux/build_x86“ wird verlassen
> make: *** [Makefile:146: sub-make] Fehler 2

This is my log using LANG=C:
> {master linux} % git describe
> v4.14-3-gd893dbcff8e3
> {master linux} % rm -fr build_x86/tools/
> {master linux} % LANG=C make O=build_x86/ -j9 tools/iio
> make[1]: Entering directory '/home/alex/Dokumente/repo/linux/build_x86'
>   DESCEND  iio
> mkdir -p /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio 2>&1 || true
> ln -sf /home/alex/Dokumente/repo/linux/tools/iio/../../include/uapi/linux/iio/events.h /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio
> ln -sf /home/alex/Dokumente/repo/linux/tools/iio/../../include/uapi/linux/iio/types.h /home/alex/Dokumente/repo/linux/build_x86/tools/iio/include/linux/iio
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_generic_buffer.o
>   CC       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_utils.o
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor-in.o
>   LINK     /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_event_monitor
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio-in.o
>   LD       /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_generic_buffer-in.o
>   LINK     /home/alex/Dokumente/repo/linux/build_x86/tools/iio/lsiio
>   LINK     /home/alex/Dokumente/repo/linux/build_x86/tools/iio/iio_generic_buffer
> make[1]: Leaving directory '/home/alex/Dokumente/repo/linux/build_x86'

In both cases tools/iio/iio_utils.o is compiled thrice. Depending on the exact timing you might get a truncated file.
I suspect the following commit: 18956cf2d78a ("iio: tools: move to tools buildsystem", 2017-07-29)
as iio_utils.o is referenced in all 3 tools.

Best regards,
Alexander

